
int t = 0;
IssueSpot[] is = new IssueSpot[4000];
int diameter = 2;
int userNameAreaWidth = 150;
boolean isPlay = false;
 
void setup(){
  size(800, 800);
  //int h = diameter * is.length * 2;
  //size(700, h);
  background(0);
  frameRate(50);
   
  // setup for Issue Spot
  String[] statusNames = {"Not Exists", "New", "In Progress", "Solved", "Closed"};
  int[]    updateTimes1  = {0,   1, 250, 300, 500};
  int[]    updateTimes2  = {0,  50, 100, 300, 400};
  int[]    updateTimes3  = {0, 150, 200, 400, 600};
  int[]    updateTimes4  = {0, 250, 350, 480, 580};
  int[]    updateTimes5  = {0, 300, 450, 500, 580};
  int[]    updateTimes6  = {0, 150, 360, 420, 480};
  int[]    updateTimes7  = {0,  80, 300, 360, 450};
  int[]    updateTimes8  = {0, 130, 230, 390, 490}; 
  int[]    updateTimes9  = {0, 400, 490, 560, 620};
  int[]    updateTimes10 = {0, 290, 520, 630, 690};
  int[]    updateTimes11 = {0,  40, 120, 450, 510};
  int[]    updateTimes12 = {0, 250, 320, 390, 430};
  int[]    updateTimes13 = {0, 150, 200, 290, 340};
  int[]    updateTimes14 = {0, 250, 290, 320, 390};
  int[]    updateTimes15 = {0, 300, 450, 500, 580};
  int[]    updateTimes16 = {0, 150, 360, 420, 480};
  int[]    updateTimes17 = {0,  80, 300, 360, 450};
  int[]    updateTimes18 = {0, 130, 230, 390, 490}; 
  int[]    updateTimes19 = {0, 400, 490, 560, 620};
  int[]    updateTimes20 = {0, 290, 520, 630, 690};
  int[]    updateTimes21 = {0, 240, 390, 450, 510};
   
  int[][] updateTimes = {updateTimes1, updateTimes2, updateTimes3, updateTimes4, updateTimes5, updateTimes6,
                         updateTimes7, updateTimes8, updateTimes9, updateTimes10, updateTimes11, updateTimes12,
                         updateTimes13, updateTimes14, updateTimes15, updateTimes16, updateTimes17, updateTimes18,
                         updateTimes19, updateTimes20, updateTimes21};

  for(int i = 0; i < is.length; i++){
    int tmp = int(random(21));
    is[i] = new IssueSpot(i+1, updateTimes[tmp], statusNames);
  }
  isPlay = true;
}
 
void draw(){
  t += 1;
  // draw IssueSpot
  noStroke();
  for(int i = 0; i < is.length; i++){
    //is[i].move();
    is[i].update(t);
  }
}
 
void mouseClicked() {
  if (isPlay == true) {
    noLoop();
    isPlay = false;
  } else {
    loop();
    isPlay = true;
  }
}
class IssueSpot {
  int issueId;
  int x, y;
  //int x = 0;
  //float y;
  int[] statusUpdateHistory;
  String[] statusNameHistory;
  int idAssignedTo;
   
  IssueSpot(int _id, int[] _updateTimeHistory, String[] _statusHistory) {
    issueId = _id;
    //y = diameter * (issueId - 1) + diameter / 2;
    x = int(random(width));
    //y = int(random(pow(pow(800, 2) - pow(x, 2), 0.5)));
    y = 400 + int(pow(-1,int(random(2)))) * int(random(pow(x * (800 - x), 0.5)));
    statusUpdateHistory = _updateTimeHistory;
    statusNameHistory = _statusHistory;
  }
   
  void move(){
    x += diameter / 2;
  }
   
  void update(int t){
    int statusIndex = currentStatusIndex(t);
    String currentStatus = statusNameHistory[statusIndex];
    int statusColorHex = statusColor(currentStatus);
    fill(statusColorHex);
    ellipse(x, y, diameter, diameter);
  }
   
  int currentStatusIndex(int t){
    int sIdx = 0;
    for(int i = 0; i < statusUpdateHistory.length; i++){
      if (t >= statusUpdateHistory[i]) sIdx = i;
    }
    return sIdx;
  }
 
  int statusColor(String statusName){
    int hexColor;
    if      (statusName.equals("New"))         hexColor = #ff0000; // Red
    else if (statusName.equals("In Progress")) hexColor = #ffff00; // Yellow
    else if (statusName.equals("Solved"))      hexColor = #80ff00; // Green
    else if (statusName.equals("Closed"))      hexColor = #0000ff; // Blue
    else if (statusName.equals("Not Exists"))  hexColor = #000000; // Black
    else                                       hexColor = #ff00ff; // Purple
    return hexColor;
  }
}


