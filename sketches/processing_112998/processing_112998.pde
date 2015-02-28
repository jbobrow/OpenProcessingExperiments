
import com.francisli.processing.http.*;


PImage profilepicture;

String username;
String tag;
String[] tagStrings;
String search;
Integer arrSize;

HttpClient client;

//numbers of columns and rows
int cols = 5;
int rows = 5;
PImage[] userphoto = new PImage[cols*rows];

// Declare 2D array
Cell[][] grid;

void setup() {
  size(900, 900, P3D);
  smooth();

  // Initialize 2D array values
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*150, j*150, 150, 150, i+j);
    }
  }
}


//images are drawn here
void draw() {
  println(mouseX);
  background(255);
  imageMode(CENTER);

  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      //  display each object

      grid[i][j].display();
    }
  }
}



//event is called here
void keyPressed() {
  println(key);
  if (key == 'm' || key == 'M') {
    searchImage("/v1/tags/livelovebeirut/media/recent.json");
    println("search livelovebeirut");
  }
  if (key == '1' || key == '2') {
    searchImage("/v1/tags/accd/media/recent.json");
    println("search accd");
  }
}



//search function is called here
void searchImage(String search) {
  client = new HttpClient(this, "api.instagram.com");
  client.useSSL = true;
  //// instantiate a new HashMap
  HashMap params = new HashMap();
  //// put key/value pairs that you want to send in the request
  params.put("access_token", "13723627.0b2da60.7f7c3efcca474ed88290a579796ae562");
  params.put("count", str(cols*rows));
  client.GET(search, params);
}

//instagram api image loading is here
void responseReceived(HttpRequest request, HttpResponse response) {
  println(response.getContentAsString());

  //// we get the server response as a JSON object
  JSONObject content = response.getContentAsJSONObject();

  //// get the "data" value, which is an array
  if (content.get("data") != null) {
    JSONObject data = content.get("data");
    arrSize = data.size();
    println("arrSize "+arrSize);

    //// get the first element in the array
    //JSONObject first = data.get(0);
    if (data.get(arrSize-1).get("user") != null) {
      for (int i = 0; i < arrSize; i++) {

        String userphoto_url = data.get(i).get("images").get("standard_resolution").get("url").stringValue();
        userphoto[i] = loadImage(userphoto_url, "png");
        println("userphoto "+i+" "+userphoto[i]);
      }
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x, y;  // x,y location
  float w, h;   // width and height
  int num; // angle for oscillating brightness
 

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, int tempNum) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    num = tempNum;
  } 



  void display() {
    stroke(255);

    // Color cell with texture of PImage=userphoto

    beginShape();
    if (userphoto != null) {
      texture(userphoto[num]);
      // println("userphoto "+userphoto);
      vertex(x, y, 0, 0);
      vertex(x+w, y, 650, 0);
      vertex(x+w, y+h, 650, 650);
      vertex(x, y+h, 0, 650);
      endShape();
    }
  }
}


