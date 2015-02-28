
String[] lwrf_03Data;
int [] collision;
int [] coalesence;


void setup() {
  smooth();
  size(400, 400);
  // TEXT FILE TO ARRAY
  String[] textFile = loadStrings("lwrf_03.txt");
  collision = new int[textFile.length-1];
  coalesence = new int[textFile.length-1];
  // STRING TO ARRAY
  lwrf_03Data = split(textFile[1], '\t');
  for(int i=0; i<textFile.length-1; i++){
    lwrf_03Data = split(textFile[i+1], '\t');
     //column 1 collision - column 2 coalesence
    collision[i] = int(lwrf_03Data[0]);
    coalesence[i] = int(lwrf_03Data[1]);
    
  }
}

void draw() {
 background(0);
  noStroke();
   
  //draw collision values
  for (int i=0; i<collision.length; i++) {
    rect (random(i),0,random (i), 450);
    ellipse(random(i),random(i), 15, 15);
     
    stroke( 21, 156, 173);
    fill(0);
    
    ellipse(random(i),random(i), 30, 30);
    stroke( 21, 15, 173);
    fill(250,139,3);
    
  //conditon collision regarding coalesence
    if (collision[i] >= coalesence[i]){
     
    }
     
  }
   
    //draw coalesence values 
  for (int i=0; i<coalesence.length; i++) {
    line (random(i),0,random (i), 450);
     
    stroke(255);
    fill(15, 0 , 11);
    
    ellipse(random(i),random(i), 7, 7);
    fill(250,139,3);
    
    
    }
  }




