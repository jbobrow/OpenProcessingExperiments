
int w=100;
int x=140;
int y=300;
int z=200;

void setup() {
  size(600,600);
  background(255);
  smooth();
}
void draw() { 

  float mapColorR=map(mouseX,0,600,30,255);//0=smallest
  float mapColorG=map(mouseX,0,600,70,255);
  float mapColorB=map(mouseX,0,600,50,255);
  fill(mapColorR, mapColorG, mapColorB);
  rect(0,0,width,height);



  {
    PImage c;
    boolean k=true;

    c=loadImage("cave.jpg");
    tint(150,200,100,200);
    image(c,0,0,600,600);
  }



  //The very right one of the black shapes
  stroke(193,141,191);
  strokeWeight(8);
  fill(0);
  smooth();

  beginShape();
  vertex(400,300);
  vertex(540,300);
  vertex(540,520);
  vertex(180,600);
  vertex(60,600);
  vertex(400,300);
  endShape();


  fill(0);
  smooth();
  triangle(0,600,340,0,380,0);

  strokeWeight(10);
  stroke(154,26,75);


  //keep pressing
  line(0,600,x,y);
  quad(w+40,z*2,w+80,z+220,40,600,20,600);
  if (mousePressed==true) {
    w++;
    x++;
    y--;
    z--;
  }

quad(100,200,140,260,0,580,0,500);

  fill(66,59,20);
  noStroke();
  triangle(600,540,600,600,340,600);

  fill(66,59,20);
  noStroke();
  triangle(0,0,140,0,0,440);




  {
    fill(255);
    noStroke();
    if((mouseX>=300)&&(mouseY<=80)) {
      quad(390,20,420,50,390,80,360,50);
    }
    else if((mouseX<=200)&&(mouseY<=200)) {
      quad(70,80,100,110,70,140,40,110);
    }
    else if((mouseX>=400)&&(mouseY>=100))
      quad(460,120,520,180,460,340,400,180);
  }
}


