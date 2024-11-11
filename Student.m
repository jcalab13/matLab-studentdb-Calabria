classdef Student
    properties
        ID     % Unique student ID
        Name   % Name of the student
        Age    % Age of the student
        GPA    % GPA of the student
        Major  % Major field of study
    end
    
    methods
        % Constructor
        function obj = Student(ID, Name, Age, GPA, Major)
            obj.ID = ID;
            obj.Name = Name;
            obj.Age = Age;
            obj.GPA = GPA;
            obj.Major = Major;
        end
        
        % Method to display student information
        function displayInfo(obj)
            fprintf('Student ID: %s\n', obj.ID);
            fprintf('Name: %s\n', obj.Name);
            fprintf('Age: %d\n', obj.Age);
            fprintf('GPA: %.2f\n', obj.GPA);
            fprintf('Major: %s\n', obj.Major);
        end
        
        % Method to update GPA
        function obj = updateGPA(obj, newGPA)
            obj.GPA = newGPA;
        end
    end
end
