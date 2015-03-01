
int t = 0;
User[] users = new User[2];
IssueSpot[] is = new IssueSpot[4];
int diameter = 10;
int userNameAreaWidth = 150;
boolean isPlay = false;

void setup(){
  size(800, 300);
  //int h = diameter * is.length * 2;
  //size(700, h);
  background(0);
  frameRate(5);
  
  // setup for User
  users[0] = new User(1, "Buntaro.Orita");
  users[1] = new User(2, "User2"); 
  
  // setup for Issue Spot
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
  
  User[] usersAssignedTo = {users[0], users[1], users[0], null};
  
  is[0] = new IssueSpot(1, updateTimes[0], statusNames[0], users[0]);
  is[1] = new IssueSpot(2, updateTimes[1], statusNames[1], users[1]);
  is[2] = new IssueSpot(3, updateTimes[2], statusNames[2], users[0]);
  is[3] = new IssueSpot(4, updateTimes[3], statusNames[3], null);

//  for(int i = 0; i < is.length; i++){
//    is[i] = new IssueSpot(i+1, updateTimes[i], statusNames[i], usersAssignedTo[i]);
//  }
  isPlay = true;
}

void draw(){
  t += 1;
  
  // draw UserName assigned
  stroke(1);
  
  fill(204);
  rect(0, 0, userNameAreaWidth, 300);
  fill(#ffffff);
  rect(0, 0, userNameAreaWidth, diameter * 2 * users[0].issueIds.size());
  rect(0, diameter * 2 * users[0].issueIds.size() + 1, userNameAreaWidth, diameter * 2 * users[1].issueIds.size());
  
  fill(0);
  textAlign(CENTER);
  text(users[0].name, userNameAreaWidth / 2, diameter * users[0].issueIds.size());
  text(users[1].name, userNameAreaWidth / 2, diameter * 2 * users[0].issueIds.size() + diameter * users[1].issueIds.size() + 5);
  
  // draw IssueSpot
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
  int issueId;
  int x = userNameAreaWidth;
  int y;
  int[] statusUpdateHistory;
  String[] statusNameHistory;
  int idAssignedTo;
  
  IssueSpot(int _id, int[] _updateTimeHistory, String[] _statusHistory, User _userAssignedTo) {
    issueId = _id;
    statusUpdateHistory = _updateTimeHistory;
    statusNameHistory = _statusHistory;
    if (_userAssignedTo != null) _userAssignedTo.assignedTo(issueId);
  }
  
  void move(){
    x += diameter / 2;
  }
  
  void update(int t){
    int statusIndex = currentStatusIndex(t);
    String currentStatus = statusNameHistory[statusIndex];
    int statusColorHex = statusColor(currentStatus);
    fill(statusColorHex);
    ellipse(x, diameter * (2 * issueId - 1), diameter, diameter);
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
class User {
  int id;
  String name;
  ArrayList issueIds = new ArrayList();
  
  User(int _id, String _name){
    id = _id;
    name = _name;
  }
  
  void assignedTo(int _issueId){
    issueIds.add(_issueId);
  }
}


