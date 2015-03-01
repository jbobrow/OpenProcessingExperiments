
PImage bad;
PImage hero;
  
   
void setup() {
size(400,400);
bad = loadImage("http://fc08.deviantart.net/fs70/f/2014/301/3/4/smily1_by_joni848-d84h7st.jpg");
hero = loadImage ("http://fc04.deviantart.net/fs70/f/2014/301/8/8/smily2_by_joni848-d84h8uq.jpg");
}
void draw(){
int r = random(150,255);
int g = random(150,255);
int b = random(150,255);
if(mousePressed==true){
image(hero,0,0,400,400);
   
   fill(r,g,b);

}else{
image(bad,0,0,400,400);

    
}
}

