
PImage fashion, apple, cam, clock, contact, fb, game, mail, mickey, bg;//declare image
PImage music, sport, openrice, phone, tool, twitter, wtsapp, youtube; //declare image
PFont f; //declare font


void setup(){
size(720,720);//set the size
fashion = loadImage("adidas.png");//load image of adidas
apple = loadImage("apple.png");//load image of apple
cam = loadImage("cam.png");//load image of cam
clock = loadImage("clock.png");//load image of clock
contact = loadImage("contact.png");//load image of contact
fb = loadImage("fb.png");//load image of fb
game = loadImage("game.png");//load image of game
mail = loadImage("mail.png");//load image of mail
mickey = loadImage("mickey.png");//load image of mickey
bg = loadImage("bg.png");//load image of bg
music = loadImage("music.png");//load image of music
sport = loadImage("Nike.png");//load image of sport
openrice = loadImage("openrice.png");//load image of openrice
phone = loadImage("phone.png");//load image of phone
tool = loadImage("tool.png");//load image of tool
twitter = loadImage("twitter bird.png");//load image of twitter
wtsapp = loadImage("wtsapp.png");//load image of wtsapp
youtube = loadImage("youtube.png");//load image of youtube

f = createFont("LucidaGrande",24);//create font
textFont(f);
fill(70);//set text color

}

void draw(){
  background(bg);//set backgrond img


int r1 =65;
int r2 =65;
int r3 =65;
int r4 =65;
int r5 =65;
int r6 =65;
int r7 =65;
int r8 =65;
int r9 =65;
int r10=65;
int r11=65;
int r12=65;
int r13=65;
int r14=65;
int r15=65;
int r16=65;//declare the size of the icons




if(width*3/10<mouseX && mouseX<width*5/10 && height*1/20<mouseY && mouseY<height*3/20){
  r1=110;
}
  
if(width*4/20<mouseX && mouseX<width*6/20 && height*2/20<mouseY && mouseY<height*4/20){
  r2=110;
}
if(width*2/20<mouseX && mouseX<width*4/20 && height*5/20<mouseY && mouseY<height*7/20){
  r3=110;
}
if(width*1/20<mouseX && mouseX<width*3/20 && height*8/20<mouseY && mouseY<height*10/20){
  r4=110;
}
if(width*1/20<mouseX && mouseX<width*3/20 && height*11/20<mouseY && mouseY<height*13/20){
  r5=110;
}
if(width*2/20<mouseX && mouseX<width*4/20 && height*14/20<mouseY && mouseY<height*16/20){
  r6=110;
}
if(width*4/20<mouseX && mouseX<width*6/20 && height*16/20<mouseY && mouseY<height*18/20){
  r7=110;
}
if(width*7/20<mouseX && mouseX<width*9/20 && height*17/20<mouseY && mouseY<height*19/20){
  r8=110;
}
if(width*11/20<mouseX && mouseX<width*13/20 && height*17/20<mouseY && mouseY<height*19/20){
  r9=110;
}
if(width*14/20<mouseX && mouseX<width*15/20 && height*16/20<mouseY && mouseY<height*18/20){
  r10=110;
}
if(width*16/20<mouseX && mouseX<width*18/20 && height*14/20<mouseY && mouseY<height*16/20){
  r11=110;
}
if(width*17/20<mouseX && mouseX<width*19/20 && height*11/20<mouseY && mouseY<height*13/20){
  r12=110;
}
if(width*17/20<mouseX && mouseX<width*19/20 && height*8/20<mouseY && mouseY<height*10/20){
  r13=110;
}
if(width*16/20<mouseX && mouseX<width*18/20 && height*5/20<mouseY && mouseY<height*7/20){
  r14=110;
}
if(width*13/20<mouseX && mouseX<width*15/20 && height*3/20<mouseY && mouseY<height*5/20){
  r15=110;
}
if(width*11/20<mouseX && mouseX<width*13/20 && height*1/20<mouseY && mouseY<height*3/20){
  r16=110;
}//set the enlargement of those icon if the mouse is on specific position


int h = hour(); 
int m = minute();
int s = second();

textAlign(CENTER,CENTER);
imageMode(CENTER);
image(apple,width/2,height/2-9,200,200);
text(h+":"+m,width/2,height/2);//set time display on the apple logo

image(cam,width*4/10,height*1/10,r1,r1);//1
image(wtsapp,width*5/20, height*3/20,r2,r2);//2
image(youtube,width*3/20, height*6/20,r3,r3);//3
image(fb,width/10, height*9/20,r4,r4); //4
image(twitter, width/10, height*6/10,r5,r5);//5
image(mail,width*3/20,height*15/20,r6,r6);//6
image(openrice,width*5/20, height*17/20,r7,r7);//7
image(clock,width*4/10,height*9/10,r8,r8);//8
image(tool,width*6/10,height*9/10,r9,r9);//9
image(mickey,width*15/20,height*17/20,r10,r10);//10
image(fashion,width*17/20,height*15/20,r11,r11);//11
image(sport,width*9/10,height*6/10,r12,r12);//12
image(game,width*9/10,height*9/20,r13,r13);//13
image(music,width*17/20,height*6/20,r14,r14);//14
image(contact,width*15/20,height*4/20,r15,r15);//15
image(phone,width*6/10,height*1/10,r16,r16);//16
//set the position of the icons
}








