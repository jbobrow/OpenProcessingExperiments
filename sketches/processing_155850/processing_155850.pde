
void setup() {
  size(1000,800);
  smooth();
    background(255,235,0);
    

}

void draw() {
  int limx1=550;
  int limx2=640;
  int posx=mouseX;
  if(mouseX<limx1){
    posx=limx1;
  }
  if(mouseX>limx2){
    posx=limx2;
  }
  
  
  int limy1=260;
  int limy2=350;
  int posy=mouseY;
  if(mouseY<limy1){
    posy=limy1;
  }
  if(mouseY>limy2){
    posy=limy2;
  }
 
  
  strokeWeight(8);
  background(255,235,0);
  fill(255);
  ellipse(600,300,200,200);
  fill(113,189,239);
  ellipse(posx,posy,100,100);
  fill(0);
  ellipse(posx,posy,50,50);
  fill(255);
  ellipse(790,360,200,200);
  fill(113,189,239);
  ellipse(-posx+1390,posy+60,100,100);
  fill(0);
  ellipse(-posx+1390,posy+60,50,50);
  
  noFill();
  curve(570,100, 530, 410, 730, 480, 620, 110);
  
  fill(255);
  quad(550,440,530,470,570,490,590,470);
  
  fill(255);
  quad(620,480,600,520,660,530,670,500);
  
  line(600,200,600,170);
  line(640,210,650,180);
  line(680,230,700,200);
  
  line(790,250,790,200);
  line(830,260,840,220);
  line(870,280,890,240);
  
//  ellipse(500,400,80,50);
//  ellipse(750,500,80,50);
  noFill();
  curve(605, 326, 605, 430, 673, 424, 673, 461);
  curve(605, 430, 673, 424, 673, 461, 615, 465); 
  curve(673, 424, 673, 461, 615, 465, 615, 465);
}
