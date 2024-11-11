% Create the student database
db = StudentDatabase();

% Add sample students
student1 = Student('1', 'Joe', 20, 3.8, 'Mechanical Engineering');
student2 = Student('2', 'Matthew', 22, 3.5, 'Mathematics');
student3 = Student('3', 'Cole', 21, 3.5, 'Mechanical Engineering');
db = db.addStudent(student1);
db = db.addStudent(student2);
db = db.addStudent(student3);

% Save the database to a file
db.saveDatabase('studentDB.mat');

% Load the database from the file
db = db.loadDatabase('studentDB.mat');

% Search for a student by ID
student = db.findStudentByID('2');
if ~isempty(student)
    student.displayInfo();
else
    disp('Student not found.');
end

% Get and display students by major
meStudents = db.getStudentsByMajor('Mechanical Engineering');
fprintf('Students in Mechanical Engineering:\n');
for i = 1:length(meStudents)
    meStudents{i}.displayInfo();
end

% Visualize the data
visualizeData(db);
