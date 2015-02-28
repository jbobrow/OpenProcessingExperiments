
import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioSample correct;
AudioSample wrong;

import rita.*;

RiGrammar grammar;
RiText[] rts = new RiText[12];
//int[] wx = new int[12];
//int[] wy = new int[12];
int[] rand = new int [12];
String a, b;
int x;
int stage = 0;
boolean start = true;
float[] colour = { 
  255, 0, 0, 0
};

int[] storage = new int [3];



int ans = 0;

int s = 0;

int m;

int[] markx = new int [3];

int[] marky = new int [3];

//////random xy

int []wx = {
  297, 169, 433, 136, 468, 158, 445, 189, 427, 224, 403, 297
};
int []wy = {
  70, 90, 90, 116, 116, 146, 146, 180, 180, 211, 211, 242
}; 

int[] posx = new int [12];

int[] posy = new int [12];

////////////////

float corrx = 1;
float corry = 1;
int corra = 255;
int corrs = 30;

String[] image = {"ans1.png","ans2.png","ans3.png"};
String[] imagebg = {"bg1.png","bg2.png"};
String[] hint_arr = {"cat.png","mom.png","tea.png","aer.png","spa.png","ham.png","mouse.png","ball.png","bus.png","pir.jpg"};

PImage [] bg = new PImage[2];
PImage [] answer = new PImage[3];
PImage [] hint = new PImage[10];

void setup()
{
  
  size(611, 400);
  
  minim = new Minim(this);
  player = minim.loadFile("BGM.mp3");
  player.loop();
  
  correct = minim.loadSample("correct.mp3", 128);
  wrong = minim.loadSample("wrong.mp3", 128);
 
 
  
  PFont pf = loadFont("Courier-18.vlw");
  //textFont(pf);

  


  RiText.defaults.fontSize = 18;
  RiText.defaults.alignment = LEFT;
  RiText.defaultFont(pf);
  //RiText.fontSize(18);

for (int i = 0; i < 2 ; i++){
  bg[i] = loadImage(imagebg[i]);

  }
  
  for (int i = 0; i < 3 ; i++){
  answer[i] = loadImage(image[i]);

  }
  
  for (int i = 0; i < 10 ; i++){
    hint[i] = loadImage(hint_arr[i]);
  }

  rts[0] = new RiText(this, "ask: ", 130, 330);
  rts[1] = new RiText(this, "can", 190, 330);
  rts[2] = new RiText(this, "you", 235, 330);
  rts[3] = new RiText(this, "read",280, 330);
  rts[4] = new RiText(this, "my", 340, 330);
  rts[5] = new RiText(this, "mind?", 375, 330);
  rts[6] = new RiText(this, "if yes,", 130, 355);
  rts[7] = new RiText(this, "please", 220, 355);
  rts[8] = new RiText(this, "click", 295, 355);
  rts[9] = new RiText(this, "to", 360, 355);
  rts[10] = new RiText(this, "play",395, 355);
  rts[11] = new RiText(this, "with me(:", 450, 355);

  grammar = new RiGrammar(this);
  grammar.loadFrom("sample.json");

  b = "aaa";
}

void draw()
{
  
  
  
  image(bg[s], 0, 0);


  for (int k = 0; k < rts.length; k++) {
    rts[k].draw();
  }


  

  if (stage > 0) {
    
    
    
    for (int i = 0; i < 12 ; i++) {
      if ( mouseX >= posx[i] && mouseX <= (posx[i]+rts[i].length()*10) && mouseY >= posy[i]-10 && mouseY <= posy[i]+10) {
        fill(0, 255, 0);
        noStroke();
        rect(posx[i], posy[i]+5, rts[i].length()*10, 5);
      }
    }

    for (int j = 0; j<3; j++) {

      if (ans > j) {
        image(answer[j],markx[j], marky[j]);
      }
    }
    
    if (ans == 3){
     check(); 
     
    }
    
    
    /////display image
    
    //b = rts[0].text();
    
    fill(0);
    textAlign(LEFT);
    textSize(13);
    text("hint.png",170,365);
    text("select 3 words in order.",390,325);
    text("Can you guess my sentence?",390,340);
    if (rts[0].equals("Aeroplane") == true )
      {
        image(hint[3],150,270,100,80);
        
        
        //text("hint.png",170,365);
        
      } 
    
    if (rts[0].equals("The cat") == true )
      {
        image(hint[0],150,270,100,80);
        fill(0);
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    if (rts[0].equals("My mom") == true )
      {
        image(hint[1],150,270,100,80);
        fill(0);
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    if (rts[0].equals("The teacher") == true )
      {
        image(hint[2],150,270,100,80);
        fill(0);
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    if (rts[0].equals("The sparrow") == true )
      {
        image(hint[4],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    if (rts[0].equals("The hamburger") == true )
      {
        image(hint[5],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    if (rts[0].equals("The mouse") == true )
      {
        image(hint[6],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
      
      if (rts[0].equals("The balloon") == true )
      {
        image(hint[7],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
      
      if (rts[0].equals("The bus") == true )
      {
        image(hint[8],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
    
     if (rts[0].equals("The pirate") == true )
      {
        image(hint[9],150,270,100,80);
        
        textSize(13);
        //text("hint.png",170,365);
      } 
    
    
  }
}

void mouseClicked()
{
  
  
  s = 1;
  if (stage == 0) {
    int rand[] = RiTa.randomOrdering(wx.length);
    String result = grammar.expand();
    String[] lines = result.split("%");
    for (int i = 0; i < rts.length; i++) { 
      rts[i].textTo(lines[i], 1.0);

      posx[i] = wx[rand[i]];
      posy[i] = wy[rand[i]];

      rts[i].moveTo(posx[i], posy[i], 1, 0);
      println(wx[i]);
    }

    stage ++;
  }

  /////println checking
  
  
for (int i = 0; i < wx.length ; i++) {
   print(rand[i]+",");
   print(rts[i]);
   println(rts[i].length());
   }
   
   //////
   
   
  //////coloring


  if (stage > 0) {
    corra = 255;
    for (int i = 0; i < 12 ; i++) {
      if ( mouseX >= posx[i] && mouseX <= (posx[i]+rts[i].length()*10) && mouseY >= posy[i]-10 && mouseY <= posy[i]+10) {

        println("hello");
        println(rts[i]);

        markx[m] = posx[i];
        marky[m] = posy[i];
        storage[m] = i;
        ans++;
        m++;
        
        
        
        
      }
    }
  }
}


void check(){
  
  if ( storage[0] == 0 && storage[1] == 1 && storage[2] == 2){
    println("CORRECT!");
    textAlign(CENTER);
    textSize(corrs);
    fill(0,255,0,corra);
    text("CORRECT!",300, 200);
    
    
    
    corrs+= 10;
    
    corra = corra - 20;
    
    if (corra < 0){
      correct.trigger();
    corra = 0;
    corrs = 30;
      
    stage = 0;
    m = 0;
    ans = 0;
    }
    
  }
  else{
    println("WRONG!");
    //wrong.trigger();
 
    textAlign(CENTER);
    textSize(corrs);
    fill(255,0,0,corra);
    text("WRONG!",300, 200);
    
    corrs+= 10;
    
    corra = corra - 20;
    
    if (corra < 0){
      wrong.trigger();
    m = 0;
    ans = 0;
    corra = 0;
    corrs = 30;
    
    }
    
  }
  
}

