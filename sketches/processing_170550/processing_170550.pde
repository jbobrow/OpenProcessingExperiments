
PImage openbook, header, footer, clouds;
PFont quiet, small, clueless,  hyper, fangirl, gamer, bookworm;
PFont words, determined, veteran;
char[] letters1;
char[] letters2;
String quote1= "She kept her nose in a book";
String quote2= "and her head in the clouds";
float[] y1;
float[] y2;
float xl=610;
float xr=0;

float counting=0;
float count=1;
int currentLetter1=0;
int currentLetter2=0;

void setup(){
size(600,600);
words = createFont ("Aparajita", 30);
quiet = createFont("Chiller", 32);
small = createFont("Papyrus", 18);
clueless = createFont("Ravie", 36);
hyper = createFont("Jokerman", 40);
fangirl = createFont("Pristina", 32);
gamer = createFont("Nyala", 32);
bookworm = createFont("Parchment", 75);
determined = createFont("Castellar", 30);
veteran = createFont("Stencil", 32);
openbook=requestImage("book.png");
header=requestImage("scrolltop.png");
footer=requestImage("scroll2.png");
clouds=requestImage("clouds3.png");
fill(#E0079F);
textFont(words);
textSize(40);

//quote1
letters1=quote1.toCharArray();
y1=new float [letters1.length];
for (int i=0; i< letters1.length; i++){
  y1[i]= 625;
}

//quote2
letters2=quote2.toCharArray();
y2=new float [letters2.length];
for (int i=0; i< letters2.length; i++){
  y2[i]= 625;
}
} //goes with setup {

void draw(){
counting++;
fill(255);
rect(0,0,width,height);
strokeWeight(5);
rect(25,65,549,500);
image(header,0,0,width,75);
image(footer,0,570,width,25);

if (counting>=10){
fill(#8E0D0D);
text("What strangers see...", xl,300);
xl-=1.0;
if (xl< -210){
  xl=610; 
}

if (counting>=300){
textFont(small);
fill(#591386);
text("Short", 85,410);
  if (counting>=350){
    textFont(quiet);
    fill(#6374C4);
    text("Shy", 510,545);
      if (counting>=400){
        textFont(clueless);
        fill(#346EE8);
        text("Ditzy", 400, 100);
        text("Clueless", 200,500);
              if (counting >=700){
                rect(0,0,width,height);
                strokeWeight(5);
                fill(255);
                image(header,0,0,width,75);
                image(footer,0,570,width,25);
                rect(25,65,549,500);
       if (counting >=750){
         textFont(words);
          textSize(40);
         fill(#0D8E30);
        text("What my friends know...", xr,500);
      xr += 1.0;
      if (xr>600){
      xr=-150;
      }
      textFont(hyper);
      fill(#FF9100);      
      text("Hyper", random(-600,600), random(-50,650));
        if (counting >= 800){
        textFont(fangirl);
        fill(#E80E8D);
        text("Fangirl", 430,170);
          if (counting>=825){
          textFont(gamer);
          fill(#E8D22A);
          text("Gamer", 100,150);
             if (counting>=850){
              textFont(bookworm);
              fill(#1AC487);
              text("Bookworm", 300,300);
                if (counting>=875){
                textFont(veteran);
                fill(#137E1B);
                text("Military Veteran", 30,400);
                     if (counting>=900){
                      textFont(determined);
                      fill(#0F94AA);
                      text("Persistent", 75, 250);
                      fill(#FF9100);
            if (counting>=1050){
                rect(0,0,width,height);
                strokeWeight(5);
                fill(255);
                image(header,0,0,width,75);
                image(footer,0,570,width,25);
                rect(25,65,549,500);
           if (counting>=1075){
             textFont(words);
             textSize(40);
             fill(#E0079F);
             text("What I know", 235,300);
              if (counting>=1100){
                image(openbook,25,490,550,75);
                image(clouds,25,65,550,100);
                textFont(words);
                textSize(36);
                fill(#A21E55);
                if (counting>=1125){
                  if (y1[currentLetter1] > 500){
                  y1[currentLetter1] -=10;
                     }
                      else{
                        if (currentLetter1 < letters1.length-1){
                          currentLetter1++;
                            }
                              }
                        float x1=(width-textWidth(quote1))/2;
                        for (int i=0; i < letters1.length; i++){
                        text(letters1[i], x1,y1[i]);
                        x1+=textWidth(letters1[i]);
                            }
            if (counting>=1500){
              if (y2[currentLetter2] > 145){
  y2[currentLetter2] -=35;
}
else{
  if (currentLetter2 < letters2.length-1){
    currentLetter2++;
  }
}
float x2=(width-textWidth(quote2))/2;
for (int i=0; i < letters2.length; i++){
text(letters2[i], x2,y2[i]);
x2+=textWidth(letters2[i]);
}
            }//goes with 1175
              
                }//goes with 1125
              }//goes with 1100
           }//goes with 1075
            }//goes with 1050
  } //goes with 900
  }// goes with 875
    } //goes with 850
     }//goes with 825
      }//goes with 800
        
       } //goes with 750
              } //goes with 700

      } //goes with 400
  } //goes with 350
}//goes with 300
}//goes with 10



} //goes with draw{


