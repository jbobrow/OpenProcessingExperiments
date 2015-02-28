
PImage img;
Rain r1;

int numDrops = 100;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(600,400);
  // Make a new instance of a PImage by loading an image file
     smooth();
     frameRate(100);
  
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}
float[][] fire = new float [100000][15];
float currentflamef,nextflamef;
int currentflame=0,nextflame;

void draw(){
   background(loadImage("forest.jpg"));
  noStroke();

  fill(255,80);
  rect(0,0,600,600);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
 
}

class Rain {
  float r = random(600);
  float y = random(-height);

  void fall() {
    y = y + 7;
    fill(0,10,200,180);
    ellipse(r, y, 10, 10);

   if(y>height){
   r = random(600);
   y = random(-200);
   }

  

  if(mousePressed==true){
    create_fire();
  }
  update_fire(); 
  draw_fire();
}
void update_fire(){
  for(int flame=0 ; flame<100000 ; flame++){
    if(fire[flame][0]==1){

      if(get(int(fire[flame][1]),int(fire[flame][2]))>200){
        fire[flame][0]=0;
      }
      fire[flame][1]=fire[flame][1]+fire[flame][5]*cos(fire[flame][3]);
      fire[flame][2]=fire[flame][2]+fire[flame][5]*sin(fire[flame][3]);
    }
    fire[flame][7]+=1;
    if(fire[flame][7]>fire[flame][6]){
      fire[flame][0]=0;
    }
  }
}
void draw_fire(){
  for(int flame=0 ; flame<currentflame ; flame++){
    if(fire[flame][0]==1){
      fill(fire[flame][9],fire[flame][10],0,40);
      pushMatrix();
      translate(fire[flame][1],fire[flame][2]);
      rotate(fire[flame][8]);
      rect(0,0,fire[flame][4],fire[flame][4]);
      popMatrix();
    }
  }
}
void create_fire(){
  nextflame=currentflame+10;
  for(int flame=currentflame ; flame<nextflame ; flame++){
    fire[flame][0]=1;
    fire[flame][1]=mouseX;
    fire[flame][2]=mouseY;
    fire[flame][3]=random(0,PI*2);//angle
    fire[flame][4]=random(5,15);//size
    fire[flame][5]=random(.5,1);//speed
    fire[flame][6]=random(5,20)/fire[flame][5];//maxlife
    fire[flame][7]=0;//currentlife
    fire[flame][8]=random(0,TWO_PI);
    fire[flame][9]=random(200,255);//red
    fire[flame][10]=random(50,150);//green
  }
  currentflame=nextflame;
}
}


