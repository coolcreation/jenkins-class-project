 1: Start Docker desktop.

2: From your terminal in the jenkins repo that you cloned, run the following command to start Jenkins:
```
docker compose up --build
```
3: Open your browser and go to ` http://localhost:8080` to access your Jenkins container. Log in.

4: On the dashboard, choose new item. Then choose a new freestyle workflow. Give it a name and create it.

5: On your dashboard you should see your new workflow listed. Click on it, and then click configure.

6: In the source code management section, choose git. For the repository information, put in the URL of your Python packaging project that we made the Github workflow for.

```
https://github.com/coolcreation/package-pypi-cicd
```

7: In the brandh to build box, put */main

8: In the triggers section click Poll SCM. Enter this for your schedule: H/15 * * * *

9: Add a build step of the execute shell type. Put this into the script box:
pytest --junit-xml=output.xml

10: Add a post build step of the Publish JUnit test result report type. In the test report XML box, put :
```
output.xml
```

11: Save your changes and then go back to the dashboard and click on your workflow.

12: Click on Build Now. Your workflow should run.

13: Go back to the dashboard and click your workflow again. You should see a record for the job that just ran. It may be in a failed state. Click on record link. If you want to see the output of the workflow along with possible errors, click console log.

14: Once you have a successful run, running the workflow again will likely do nothing. This is because you have not made changes to your repo on Github. If you want to see it run again, make a small change in the code and push it to github. Note that this will likely kick off your github workflow. You can disable the workflow by going to actions and then clicking on the workflow. On the top right hand side next to a filter box you will see a ... menu. Click it and choose disable workflow.
Finally, if you want to stop your Jenkins container, open a new terminal in vscode and run:
docker compose down
You can then exit Docker desktop.
Submit a screenshot showing the record of the workflow run. 