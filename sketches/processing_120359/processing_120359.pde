
/*Ricky Aye
 Steven Hargrove
 Cory Stoner
 Kevin Molczyk
 Myles Johnson*/
final int maxHeight = 700;
final int maxWidth = 1000;
int credits;
int hoursWorked;
int i = 0;
int hours;
int engage;
int soloHours;
int groupHours;
int cleanHours;
int sourceHours;
int leisureHours;
int socialHours;
float[] hoursAtClass = new float[15];
float[] classPartic = new float[15];
float[] hoursStudying = new float[15];
float[] hoursStudyGroup = new float[15];
float[] hoursResources = new float[15];
float[] hoursHygiene = new float[15];
float[] hoursSolo = new float[15];
float[] hoursSocial = new float[15];
float[] Happiness = new float[15];
float[] Grades = new float[15];
float[] Wealth = new float[15];
float GPA[] = new float[15];
import javax.swing.JOptionPane;
int getIntInput(String query) {
  return Integer.parseInt(JOptionPane.showInputDialog (query));
}
String getTextInput (String query) {
  return JOptionPane.showInputDialog (query);
}

void setup() {
  //create the display window
  size (maxWidth, maxHeight);
  //make the background color medium gray
  background (125);
  //get number of credits for semester from user
  credits = getIntInput("How many credits are your classes worth this semester?");
  //get number of hoursWorked from user
  hoursWorked = getIntInput("How many hours will you work this week?" + " 168 Hours Remaining.");
}

void calculateHappiness() {
  Happiness[0] = 50;
}

void calculateGrades() {
  Grades[0] = 90;
}

void calculateWealth() {
  Wealth[0] = 0;
  if (hoursWorked <=168) {
    Wealth[i] = hoursWorked*5;
  }
}

void drawGraphs() {
}

void updateVariables() {
  hours = getIntInput("How many hours will you attend class this week?" + (168 - hoursWorked) + " Hours Remaining.");
  engage = getIntInput("What percentage of class will you spend actively engaged?");
  soloHours = getIntInput("How many hours will you spend studying alone?" + (168 - (hoursWorked + hours)) + " Hours Remaining.");
  groupHours = getIntInput("How many hours will you spend studying in a group?" + (168 - (hoursWorked + hours + soloHours)) + " Hours Remaining.");
  sourceHours = getIntInput("How many hours are you going to spend using school resources (i.e. the library or tutoring) ?");
  cleanHours = getIntInput("How many hours are you going to spend taking care of yourself (eating, sleeping, bathing) ?");
  leisureHours = getIntInput("How many hours are you going to spend doing whatever you want?");
  socialHours = getIntInput("How many hours are you going to be hanging out with friends?");
  if (hoursWorked > 168) {
    hoursWorked = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 168! How many hours will you work this week?");
  }
  if (hours > credits) {
    hours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND" + credits + "! How many hours will you attend class?");
  }
  if (engage < 10 || engage > 90) {
    engage = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 10 AND 90! What percentage of class will you spend actively engaged?");
  }
  if (soloHours > 168) {
    soloHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 168! How many hours will you spend studying alone?");
  }
  if (groupHours > 5) {
    groupHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 5! How many hours will you spend studying in a group?");
  }
  if (sourceHours > 3) {
    soloHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 3! How many hours will you spend going to resources?");
  }
  if (cleanHours > 168) {
    cleanHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 168! How many hours will you spend taking care of yourself?");
  }
  if (leisureHours > 168) {
    leisureHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 168! How many hours will you spend doing whatever you want?");
  }
  if (socialHours > 168) {
    socialHours = getIntInput("ERROR: INPUT EXCEEDS MAXIMUM VALUE! INPUT A VALUE BETWEEN 0 AND 168! How many hours will you spend going out with friends?");
  }
}

void getHours() {
  /*if (hours = credits) {
   hoursAtClass[i] = hoursAtClass[i];
   }*/
  if (hours < credits) {
    hoursAtClass[i] = (100*(credits-hours))/(2*credits);
  }
}

void getActive() {
  if (engage > 10 && engage < 90) {
    if (engage < 100) {
      classPartic[i] = hoursAtClass[i] -((100-engage)/100);
    }
  }
}

void getStudySolo() {
  if (soloHours < 168) {
    if (soloHours < (2*credits)) {
      Grades[i] = Grades[i] - (100*(3*credits-hours))/(3*credits);
    }
    if (soloHours > (4*credits)) {
      Happiness[i] = Happiness[i]/(8/10);
    }
  }
}

void getStudyGroup() {
  if (groupHours > 0 && groupHours <= 5) {
    Grades[i] = Grades[i] * (groupHours * 1.015);
    Happiness[i] = Happiness[i] * (groupHours * 1.03);
  }
}

void getSources() {
  if (sourceHours > 0 && sourceHours <= 3) {
    Grades[i] = Grades[i]*(sourceHours*1.05);
  }
}

void getClean() {
  if (cleanHours < 70) {
    Grades[i] = Grades[i] -(100*(70-cleanHours)/280);
    Happiness[i] = Happiness[i] -(100*(70-cleanHours)/280);
  }
}

void getSolo() {
  if (leisureHours < 168) {
    Happiness[i] = Happiness[i] * 1.02;
  }
}

void getSocial() {
  if (socialHours < 168) {
    Happiness[i] = Happiness[i] * 1.03;
  }
}

void errorCheck() {
}
void draw() {
  if (i<15) {
    updateVariables();
    calculateHappiness();
    calculateGrades();
    calculateWealth();
    drawGraphs();
    getHours();
    getActive();
    getStudySolo();
    getStudyGroup();
    getSources();
    getClean();
    getSolo();
    getSocial();
  }
  else {
  }
}

