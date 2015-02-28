

//Rend Shamma
//the code for gravity was taken and altered from blindfish at http://openprocessing.org/visuals/?visualID=9932#

boolean ballstate=false;
int value = 0;
//int p=0;//array and start value 
int posX=0;
int posY=0;
int howMany=2000;
float gravity= 0.9;
PShape s;


int[] diameter=new int [howMany];
int[] c1= new int [howMany];
float [] x= new float[howMany];
float[] p=new float [howMany];
float[] mx=new float[howMany]; //start values in setup
float[] my=new float[howMany];
int counter=0;

void setup() {
  size(1024,768);
  smooth(); 

  loadPixels();
  s=loadShape ("image.svg");
  smooth();
  shape(s,0,0,1024,768);

  for (int i=0;i<howMany;i++) {

    //diameter[i]=round(random(2,40));
    x[i]=random(1,30);
    mx[i]=-50;
    my[i]=-50;

    c1[i]=0;

    diameter[i]=round(random (5, 50));
  }
}

void draw() {
  shape(s,0,0,1024,768);
  if (ballstate==true) {
    stroke(0);

    if (keyPressed == true) {
      shape(s,0,0,1024,768);
      counter=0;
    }




    for (int i=0;i<counter;i++) {

      fill(c1[i]);
      stroke(0);
      ellipse(mx[i],my[i]+p[i],diameter[i],diameter[i]); 

      my[i] = constrain(my[i],0,height-20);
      my[i] = my[i] + p[i];
      p[i]+= gravity; 

      if(my[i]+p[i]>(height-10)) {
        p[i]*=-0.8;
      }
      else {

        fill(c1[i]);
        stroke(0);
      }
    }
  }
}
//void mousePressed () {
// ballstate=false;
//}

void mouseReleased() {
  ballstate=true;
  c1[counter]=get(mouseX,mouseY);
  p[counter]=0;
  mx[counter]=mouseX;
  my[counter]=mouseY;
  println(mouseX + " " + mouseY);
  counter++;
}

void mouseDragged() {
  ballstate=true;
  noStroke();
  p[counter]=0;
  c1[counter]=get(mouseX,mouseY);
  mx[counter]=mouseX;
  my[counter]=mouseY;
  println(mouseX + " " + mouseY);
  counter++;
}


