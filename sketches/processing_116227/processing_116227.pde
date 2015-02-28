
String directions = "F";
float theta = 60;

int depth = 7;
float dist = .5;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  Turtle harry = new Turtle(new PVector(0, height/2), 0, 100);
 
  String b = processString(directions, depth);
  
  moveTurtle(harry, b);
}

void draw() {  //draw function loops 
    
}

void moveTurtle(Turtle t, String s){
    char[] chars = s.toCharArray();
    for(char c: chars){
        if(c=='+'){
            t.rotate(theta);
        } else if(c == '-'){
            t.rotate(-theta);
        } else if(c=='F'){
            t.paint(dist,0);
        }
    }
}

String processString(String s, int n){
    if(n==0){
        return s;
    }
    char[] chars = s.toCharArray();
    String result = "";
    for(char c : chars){
        if(c=='+' || c == '-'){
            result += c.toString();
        } else {
            if(c=='F'){
                result += "F+F--F+F";
            }
        }
    }
    return processString(result, n-1);
}


class Turtle{
    PVector position;
    float heading;
    float color;
    
    public Turtle(PVector pos, float head, int col){
        position = pos;
        heading = head;
        color = col;
    }
    
    void rotate(float theta){
        heading += theta;
    }
    
    void paint(int dist, int theta){
        rotate(theta);
        stroke(color, 255, 100);
        line(position.x, position.y, position.x+dist*cos(radians(heading )), position.y+dist*sin(radians(heading )));
        position = new PVector(position.x+dist*cos(radians(heading )), position.y+dist*sin(radians(heading )));
    }
}
