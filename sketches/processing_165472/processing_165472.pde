
ArrayList<poly> plist = new ArrayList<poly>();
void setup(){
  size(800,500);
  plist.add(new poly());
  plist.get(0).init(width/2, height/2, round(random(3,10)));
  colorMode(HSB);
}
void draw(){
  background(0);
  for(int i = 0; i< plist.size(); i++){
   plist.get(i).check();
   plist.get(i).drawShape(); 
  }
}
class poly{
  PVector position;
  PVector velocity;
  int sides;
  int rad;
  int resp_prob;
  int Mute_Prob;
  float d;
  float dincre;
 poly(){}
void init(float x, float y, int s){
  float d = random(PI);
  float v = random(2,10);
  velocity = new PVector(sin(d)*v, cos(d)*v);
  position = new PVector(x,y);
  sides = s;
  rad = round(random(10,30));
  resp_prob = round(random(2, 6));
  Mute_Prob = round(random(3, 8));
  d=0;
  dincre = random(0, radians(10));
} 
void check(){
 if(position.x-rad<0){
  position.x=rad;
  velocity.x*=-1;
  B_fission();
  //println(position.x + " " + velocity.x);
 }
 if(position.y-rad<0){
   position.y=rad;
   velocity.y*=-1;
   B_fission();
   //println(position.y + " " + velocity.y);
 }
 if(position.x+rad>width){
  position.x = width-rad;  
  velocity.x*=-1;
  B_fission();
 }
 if(position.y+rad>height){
  position.y = height-rad; 
  velocity.y*=-1;
  B_fission();
 }
 position.x += velocity.x;
 position.y += velocity.y;
 d+=dincre;
}

void drawShape(){
  fill(25.5*sides, 150,150);
  beginShape();
 for(int i = 0; i < sides; i++){
    vertex(position.x+sin(((TWO_PI/sides)*i)+d)*rad, position.y+cos(((TWO_PI/sides)*i)+d)*rad);
} 
endShape(CLOSE);
}
void B_fission(){
  if(round(random(resp_prob)) == 0){
   if(round(random(Mute_Prob)) == 0){
    int s = plist.size();
    plist.add(new poly());
    plist.get(s).init(position.x, position.y, round(random(3,10)));
   }else{
    int s = plist.size();
    plist.add(new poly());
    plist.get(s).init(position.x, position.y, sides);
   } 
  }
}
}
