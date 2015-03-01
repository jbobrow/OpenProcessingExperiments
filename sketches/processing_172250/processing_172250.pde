
int t = 0;
IssueSpot[] is = new IssueSpot[60];
int diameter = 10;
boolean isPlay = false;


void setup(){
  size(900, 700);
  //int h = diameter * is.length * 2;
  //size(100, h);
  background(0);
  frameRate(5);
  
  int[] updateTimes1 = {0, 10, 25, 30};
  String[] statusNames1 = {"New", "In Progress", "Solved", "Closed"};
  
  int[] updateTimes2 = {0, 5, 10, 30};
  String[] statusNames2 = {"Not Exists", "New", "In Progress", "Solved"};
  
  int[] updateTimes3 = {0, 15, 20};
  String[] statusNames3 = {"Not Exists", "New", "In Progress"};
  
  int[] updateTimes4 = {0, 25};
  String[] statusNames4 = {"Not Exists", "New"};
  
  int[][] updateTimes = {updateTimes1, updateTimes2, updateTimes3, updateTimes4};
  String[][] statusNames = {statusNames1, statusNames2, statusNames3, statusNames4};
  
  for(int i = 0; i < is.length; i++){
    int tmp = int(random(updateTimes.length));
    is[i] = new IssueSpot(i, updateTimes[tmp], statusNames[tmp]);
  }
  isPlay = true;
}

void draw(){
  t += 1;
  noStroke();
  for(int i = 0; i < is.length; i++){
    is[i].move();
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
  int index;
  int x = 0;
  int y;
  int[] statusUpdateHistory;
  String[] statusNameHistory;
  
  IssueSpot(int _index, int[] _updateTimeHistory, String[] _statusHistory) {
    index = _index;
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
    ellipse(x, diameter * (0.5 + 2 * index), diameter, diameter);
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


