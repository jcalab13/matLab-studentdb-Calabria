function visualizeData(database)
    % Custom colors
    histogramColor = [0.2, 0.6, 0.8];  % Light blue color for the histogram bars
    barColor = [0.8, 0.4, 0.2];        % Orange color for the bar plot
    
    % GPA Distribution Histogram 
    GPAs = cellfun(@(s) s.GPA, database.Students); % Extract GPA values
    fig1 = figure('Name', 'GPA Distribution', 'NumberTitle', 'off');
    ax1 = axes(fig1);
    h = histogram(ax1, GPAs, 10); % Default orientation (vertical histogram)
    h.FaceColor = histogramColor; % Set custom color for histogram bars
    title(ax1, 'GPA Distribution'); % Set title
    xlabel(ax1, 'GPA'); % Set x-axis label
    ylabel(ax1, 'Number of Students'); % Set y-axis label
    grid(ax1, 'on'); % Turn on grid
    
    % Data cursor for interactive display
    datacursormode(fig1, 'on'); % Turn on the interactive data cursor

    % Average GPA by Major
    majors = unique(cellfun(@(s) s.Major, database.Students, 'UniformOutput', false));
    avgGPA = zeros(length(majors), 1);
    for i = 1:length(majors)
        majorStudents = database.getStudentsByMajor(majors{i});
        avgGPA(i) = mean(cellfun(@(s) s.GPA, majorStudents));
    end
    
    figure;
    b = bar(avgGPA); % Bar plot
    b.FaceColor = barColor; % Set custom color for bars
    set(gca, 'XTickLabel', majors); % Set x-axis tick labels to majors
    title('Average GPA by Major'); % Set title 
    xlabel('Major'); % Set x-axis label 
    ylabel('Average GPA'); % Set y-axis label
    grid on; % Turn on grid
    
    % Age Distribution
    ages = cellfun(@(s) s.Age, database.Students);
    figure;
    h2 = histogram(ages, 10); % Age distribution histogram
    h2.FaceColor = [0.6, 0.8, 0.2]; % Custom color for age histogram (light green)
    title('Age Distribution'); % Set title
    xlabel('Age'); % Set x-axis label
    ylabel('Number of Students'); % Set y-axis
    grid on; % Turn on grid
end
