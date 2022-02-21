# Pewlett Hackard Analysis

## Overview of Project

In this analysis I utilized data from six separate CSV files containing employee information for one company. Using join queries in SQL, I sought to create a list of retirement candidates along with their most recent title. To narrow down this list, I filtered the data on date of birth as well as employment end date (those who already ended their employment were not listed). Next, I created a similar list that holds employees who are ideal candidates to serve as mentors for new incoming employees. This list was created by filtering on employees born in the year 1965, as such workers were likely to be long-tenured but still at least a few years from retiring. To complete this analysis I used PostgreSQL12 along with pgAdmin 4.

## Results


### List or Retirement Candidates

![Screen Shot 2022-02-20 at 8 50 21 AM](https://user-images.githubusercontent.com/95651156/154854063-2d3b9508-024d-43ea-996e-42e1dab74fd6.png)

The above image is a preview of the list of retirement candidates that I exported into a CSV file.

#### Key Takeaways from list of retirement candidates
* ![Screen Shot 2022-02-20 at 8 52 44 AM](https://user-images.githubusercontent.com/95651156/154854343-449266c3-2052-4b8e-9fac-23a92fad8d28.png)

![Screen Shot 2022-02-20 at 8 57 17 AM](https://user-images.githubusercontent.com/95651156/154854358-111ff854-7f43-4bc7-9898-09996c2a67b3.png)

There are 72,458 employees at the company who are considered candidates to retire, as seen from the above query and result

* ![Screen Shot 2022-02-20 at 9 19 11 AM](https://user-images.githubusercontent.com/95651156/154855368-c642955a-838d-465a-a798-d19155596846.png)

* * From the above query that counts the number of retiremnt candidates by job title I conclude:
* * * The group of Senior Engineers is most at risk of being depleted from retiring employees with 25,916 potential retirees
* * * 2 of the company's 24 managers are candidates to retire

### List of Mentor Candidates

![Screen Shot 2022-02-20 at 9 26 39 AM](https://user-images.githubusercontent.com/95651156/154855644-b1750619-228b-4c8f-9d1f-8132031115fa.png)

The above image is a preview of the list of mentor candidates that I exported into a CSV file.

#### Key Takeaways from list of mentor candidates

* ![Screen Shot 2022-02-20 at 9 34 18 AM](https://user-images.githubusercontent.com/95651156/154855929-e811bcc7-b031-420d-90ae-2a2e398a4f3d.png)

* * There are 1,549 employees who are strong candidates to mentor new employees

* ![Screen Shot 2022-02-20 at 9 32 09 AM](https://user-images.githubusercontent.com/95651156/154855855-3126897e-4007-4c88-9b4d-412afaded8bc.png)

* * From the above query that counts the number of mentor candidates by job title I conclude:
* * *  A vast majority of mentor candidates come from those who are Senior Staff (569) or Senior Engineer (529)

## Summary

From the results section I concluded that the company has 72,458 employees who are considered candidates to retire . However, I know that not all of the candidates will actually retire. In order to predict the number of employees who will retire, I will see how many employees who were considered retirement eligible actually retired in the previous 12 months. In order to do this I first created a table listing all retirement-eligible employees in the previous year (using the same birthday criteria as before, but moved up 1 year). This table was created using the following query:

![Screen Shot 2022-02-20 at 8 52 05 PM](https://user-images.githubusercontent.com/95651156/154891748-27e1154c-ec03-4a2c-b0e1-7f88d2973286.png)

Next I found the percentage of these retirement eligible employees who actually retired by dividing the count of those who retired by the count of the entire list, as seen in the following query and result:

![Screen Shot 2022-02-20 at 8 58 36 PM](https://user-images.githubusercontent.com/95651156/154892132-111d874c-45c3-46e1-98af-0430bd10f45c.png)

I see that approximately 19.87% of the employees considered retirement eligible retired in the past year. As a result, I will predict 19.87% of the currently 72,458 retirement-eligible employees to retire in the coming year. With one additional query, I can get a number for the total expected upcoming retirees:

![Screen Shot 2022-02-20 at 9 07 10 PM](https://user-images.githubusercontent.com/95651156/154892947-d6f6164b-1d7d-45e5-b8f7-e2643663a6be.png)

The above calculation leads me to predict that 14,397 employees will retire in the upcoming cycle, and thus that 14,397 new employees will need to be hired. Since I earlier determined that there were only 1,549 employees considered ready to be mentors, I conclude that there are not enough potential mentors to satisfy the number of expected new employees. However, if the pool of mentors was expanded to include a wider range of ages, it may be possible to match each new employee up with a mentor.



