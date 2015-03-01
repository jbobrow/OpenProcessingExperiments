
int t = 0;
IssueSpot[] is = new IssueSpot[300];
int diameter = 8;
boolean isPlay = false;

void setup(){
  size(800, 700);
  //int h = diameter * is.length * 2;
  //size(700, h);
  background(0);
  frameRate(3);
  
  int[] updateTimes1 = {0, 10, 25, 30};
  String[] statusNames1 = {"New", "In Progress", "Solved", "Closed"};
/*  
  int[] updateTimes2 = {0, 5, 10, 30};
  String[] statusNames2 = {"Not Exists", "New", "In Progress", "Solved"};
  
  int[] updateTimes3 = {0, 15, 20};
  String[] statusNames3 = {"Not Exists", "New", "In Progress"};
  
  int[] updateTimes4 = {0, 25};
  String[] statusNames4 = {"Not Exists", "New"};
*/  

  int[] updateTimes2 = {0, 30, 45, 50, 58};
  String[] statusNames2 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};

  int[] updateTimes3 = {0, 15, 36, 42, 48};
  String[] statusNames3 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};
  
  int[] updateTimes4 = {0, 8, 30, 36, 45};
  String[] statusNames4 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};

  int[] updateTimes5 = {0, 13, 23, 39, 49};
  String[] statusNames5 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};  

  int[] updateTimes6 = {0, 40, 49, 56, 62};
  String[] statusNames6 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};

  int[] updateTimes7 = {0, 29, 52, 63, 69};
  String[] statusNames7 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};
  
  int[] updateTimes8 = {0, 4, 12, 45, 51};
  String[] statusNames8 = {"Not Exists", "New", "In Progress", "Solved", "Closed"};
  
  int[][] updateTimes = {updateTimes1, updateTimes2, updateTimes3, updateTimes4, updateTimes5, updateTimes6, updateTimes7};
  String[][] statusNames = {statusNames1, statusNames2, statusNames3, statusNames4, statusNames5, statusNames6, statusNames7};
  
  for(int i = 0; i < is.length; i++){
    int tmp = int(random(updateTimes.length));
//    is[i] = new IssueSpot(i, updateTimes[tmp], statusNames[tmp]);
    is[i] = new IssueSpot(i, updateTimes[tmp], statusNames[tmp], is[int(random(i))]);
  }
  
//  is[0] = new IssueSpot(0, updateTimes[0], statusNames[0], null);
//  is[1] = new IssueSpot(1, updateTimes[1], statusNames[1], is[0]);
//  is[2] = new IssueSpot(2, updateTimes[2], statusNames[2], is[1]);
  isPlay = true;
}

void draw(){
  t += 1;
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
  int x = 0;
  int y;
  int[] statusUpdateHistory;
  String[] statusNameHistory;
  IssueSpot parent = null;
  
  IssueSpot(int _id, int[] _updateTimeHistory, String[] _statusHistory, IssueSpot _parent) {
    issueId = _id;
    if(_parent != null) {
      parent = _parent;
//      x = _parent.x + int(random(-100, 100));
//      y = _parent.y + int(random(-100, 100));
    }
//    } else {
      x = int(random(width));
      y = int(random(height));
//    }
    statusUpdateHistory = _updateTimeHistory;
    statusNameHistory = _statusHistory;
  }
  
//  void move(){
//    x += diameter / 2;
//  }
  
  void update(int t){
    int statusIndex = currentStatusIndex(t);
    String currentStatus = statusNameHistory[statusIndex];
    int statusColorHex = statusColor(currentStatus);
    fill(statusColorHex);
    if (parent != null && !currentStatus.equals("Not Exists")) linkToParent(statusColorHex);
    if(!currentStatus.equals("Not Exists")) ellipse(x, y, diameter, diameter);
    
  }
  
  void linkToParent(int _statusColor){
    stroke(_statusColor);
    strokeWeight(1);
    line(x, y, parent.x, parent.y);
//    println("link to parent");
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
    else if (statusName.equals("In Progress")) hexColor = #ffff66; // Yellow
    else if (statusName.equals("Solved"))      hexColor = #80ff00; // Green
    else if (statusName.equals("Closed"))      hexColor = #0000ff; // Blue
    else if (statusName.equals("Not Exists"))  hexColor = #000000; // Black
    else                                       hexColor = #ff00ff; // Purple
    return hexColor;
  }
}


