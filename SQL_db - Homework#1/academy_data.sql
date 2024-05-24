DROP TABLE IF EXISTS artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album;

create table student (
ID serial primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
DateOfBirth date not null,
EnrolledDate date not null,
Gender varchar not null,
NationalIDNumber integer not null,
StudentCardNumber integer not null
);

select * from student;

create table teacher (
ID serial primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
DateOfBirth date not null,
AcademicRank integer not null,
HireDate date not null
);

select * from teacher t ;

create table course (
ID serial primary key,
Name varchar (50) not null,
Credit integer not null,
AcademicYear integer not null,
Semester integer not null
);

create table grade (
ID serial primary key,
StudentID int unique references student(id),
CourseID int unique references course(id),
TeacherID int unique references teacher(id),
Grade integer not null,
comment text not null,
CreatedDate date not null
);

select * from grade;

create table achivementType (
ID serial primary key,
Name varchar (50) not null,
Description text not null,
ParticipationRate integer not null
);

create table gradeDetails (
 ID serial primary key,
GradeID int unique references grade(id),
AchievementTypeID int unique references achivementType(id),
AchievementPoints integer not null,
AchievementMaxPoints integer not null,
AchievementDate date not null
);