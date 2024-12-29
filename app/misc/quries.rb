# 1. List all individuals who have signed up on the platform.
User.all

# 2. Find the total number of courses available.
Course.all.count

# 3. Retrieve the details of all individuals enrolled in a specific course.
Course.find_by(name: 'Name-of-course').users

# 4. Fetch the names of all courses in which a specific individual is enrolled.
User.find(-id-).courses

# 5. Count how many people are enrolled in each course.
Course.all.map {|e| "Course Name : #{e.name}, Users Enrolled: #{e.users.count}"}
# or
Course.all.map {|c| c.users.count}

# 6. Identify the course with the most enrollments.

# 7. List all enrollments where the status is marked as "completed".
Enrollment.where(status:"completed")

# 8. Fetch details of individuals who enrolled within the last 7 days.
Enrollment.where(created_at:(Time.now.midnight - 7.day .. Time.now.midnight))

# 9. List all courses that were created within the last month.
Course.where(created_at:(Time.now.midnight - 1.day .. Time.now.midnight))

# 10. Retrieve the names and enrollment dates of all individuals enrolled in a specific course.
Course.find(-id-).enrollments.map {|en| "Enrolled on #{en.created_at.to_s.slice(0,10)}, User Name: #{en.user.name}"}

# 11. Find the names of individuals who have not enrolled in any course.
User.all.filter{|u| u.name if u.courses.count == 0}

# 12. Update the enrollment status of a specific individual to "completed".
User.find(-id-).enrollments.update(status:"completed")

# 13. Remove a specific enrollment from the system.
Enrollment.find(-id-).destroy

# 14. Retrieve all courses along with the count of their enrollments.
# Course.all.map {|e| "Course : #{[*e.name]}, Users Enrolled: #{e.users.count}"}

# 15. Identify individuals who are enrolled in more than three courses.
User.all.filter{|u| u if u.courses.count > 3}

# 16. Find courses that have fewer than five enrollments.
Course.all.filter {|c| c.enrollments.count < 5}

# 17. List all individuals who have enrolled in multiple courses.
User.all.filter {|u| u.enrollments > 1}

# 18. Fetch the latest enrollment for each individual.
User.all.map {|u| u.enrollments.order(created_at: "desc").limit(1)}

# 19. Retrieve all courses sorted by the number of enrollments in descending order.
# Course.includes(:users).order(count: 'asc')

# 20. Find the average number of enrollments per course.
Enrollment.all.count / Course.all.count

# 21. Fetch the total number of enrollments on the platform.
Enrollment.all.count

# 22. Retrieve the details of the individual who has been enrolled the longest in a specific course.

# 23. List all enrollments where the status is "dropped".
Enrollment.where(status: 'dropped')

# 24. Identify courses that no one has enrolled in.
Course.all.filter {|c| c.enrollments.count == 0}

# 25. Find the top five individuals with the most enrollments.

# 26. Retrieve the most recently created course.
Course.all.order(created_at: 'desc').limit(1)

# 27. Find the individual with the highest number of completed enrollments.

# 28. Fetch all courses and include the names of individuals enrolled in each course.
Course.includes(:users).select(courses: {*}, users: {name})

# 29. List all enrollments for individuals who signed up within the last month.
Users.where(created_at: '< ')

# 30. Identify all individuals who are currently enrolled in at least one course.
User.all.filter {|u| u.enrollments.count > 0}

# 31. Retrieve the names of all courses where enrollment is still open.
User.all.filter {|u| u.enrollments.count == 0}

# 32. Count how many individuals have completed at least one course.
Enrollment.all.reduce(0) {|val,u| val += u.status == 'completed' ? 1 : 0}

# 33. Retrieve the total number of enrollments for a specific individual.
User.find(-id-).enrollments

# 34. Find individuals who enrolled in a specific course on a specific date.


# 35. Update the name of a specific course.
Course.find(-id-).update(name: 'value')

# 36. Delete a specific course from the system.
Course.find(-id-).destroy

# 37. Retrieve all courses along with the average duration of enrollments.


# 38. Fetch the details of enrollments that were updated in the last 24 hours.
Enrollment.all.filter {|e| e.updated_at >= Time.now - 1.day}

# 39. Identify individuals who have dropped out of multiple courses.
User.all.filter {|u| u.enrollments.reduce(0) {|val,e| e.status == 'dropped' ? val+1 : val} > 1}

# 40. Retrieve the count of courses where enrollment is marked as "active".


# 41. List all courses sorted alphabetically by name.
Course.all.order(name: "asc")

# 42. Find the total number of individuals who signed up on the platform.
User.all.count

# 43. Retrieve the most popular course based on enrollment numbers.

# 44. Fetch all courses where the average enrollment duration exceeds a given value.

# 45. Identify individuals who enrolled in courses but never completed any.
Enrollment.all.filter {|e| e.status != 'completed'}

# 46. Retrieve all enrollments sorted by enrollment date in descending order.
Enrollment.all.order(created_at: 'desc')

# 47. Count the number of enrollments where the status is "active".
Enrollment.all.reduce(0) {|val,ele| ele.status == 'active' ? val+1 : val}

# 48. Find individuals who have not updated their enrollment status in over a month.
Enrollment.all.filter {|e| e.updated_at <= Time.now -1.month}

# 49. Retrieve the list of all courses, including the total duration of all enrollments.

# 50. Fetch the oldest enrollment record for each course.
Course.all.map {|c| c.enrollments.order(created_at: "desc").limit(1)}