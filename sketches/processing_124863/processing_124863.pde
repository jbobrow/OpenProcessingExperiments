
//Copyright: Angela Kolosky, Carnegie Mellon University, Pittsburgh, PA
//Computing for the Arts with Processing

//HW10 Data

//Causes of Diving Fatalities
//Hover Over each cause to see the figures

PImage water, scuba;
int [ ] xCoord = {70,100,130,160,190,220,250,270,300,330,360,390,420,450,470,500,520,550,570,600};

int [ ] yBelt = {540,540,540,540,540,0,540,540,540,540,0,540,540,540,540,540,540,540,540,540};
int [ ] yAlone = {510,0,510,510,510,0,510,510,510,510,0,510,510,510,510,510,510,510,510,510};
int [ ] yVest = {300,300,300,0,0,0,300,0,300,300,0,300,300,0,0,300,300,0,0,0};
int [ ] ySurface = {0,0,0,0,300,300,300,0,0,300,300,300,300,0,0,300,300,0,0,300};
int [ ] yTraining = {0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,60,0};
float [ ] yMedical = {0,0,0,60,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0};
float [ ] yCave = {30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,};

void setup()
{
 size(900,600);
 water = loadImage ("water.jpg");
 scuba = loadImage ("scuba.png"); 
}

void draw()
{
  prepBackground();
  drawLines();
  drawText();
  drawScuba(); 
}

void drawScuba()
{
 for (int i=0; i< xCoord.length; i++)
   {
     if (mouseX < width && mouseX > 600 && mouseY < height*.3 && mouseY > height*.2)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yBelt[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("90%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("In emergency situations, divers are supposed to ditch their weight belts.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.4 && mouseY > height*.3)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yAlone[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("85%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("Scuba divers are never supposed to dive without a dive buddy.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.5 && mouseY > height*.4)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yVest[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("50%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("A buoyancy vest acts like a life vest and keeps you afloat on the surface.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.6 && mouseY > height*.5)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],ySurface[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("50%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("Accidents on the surface are the result of poor skills/user error rather than unforseen risk.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.7 && mouseY > height*.6)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yTraining[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("10%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("New divers are the most at risk for accidents given lack of experience.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.8 && mouseY > height*.7)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yMedical[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("10%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("Divers are required to pass a medical phsyical before achieving diving certifications.",300,height*.96);
       }
     if (mouseX < width && mouseX > 600 && mouseY < height*.9 && mouseY > height*.8)
       {
        imageMode(CENTER);
        image(scuba,xCoord[i],yCave[i],40,25);
        fill(255,0,0);
        textSize(18);
        textAlign(CENTER);
        text("10%",750,height*.96);
        fill(122,127,155);
        textSize(12);
        text("Lack of egress paths in underwater caves requires divers to be properly certified.",300,height*.96);
       }
   }
}

void drawText()
{
 fill(255);
 textSize(30);
 textAlign(CENTER);
   text("AVOIDABLE DIVING FATALITY STATISTICS", 450,height*.07);
 fill(255,0,0);
   text("STATS",750,height*.17);
 fill(255);
 textSize(18);  
   text("Weight Belt On",750,height*.26);
   text("Alone",750,height*.36);
   text("Uninflated Buoyancy Vest",750,height*.46);
   text("At the Surface",750,height*.56);
   text("Under Training",750,height*.66);
   text("Medically Unfit",750,height*.76);
   text("Cave Diving",750,height*.86);
}

void drawLines()
{
 stroke(255);
 strokeWeight(1);
   line(0,height*.1,900,height*.1);
   line(0,height*.2,900,height*.2);
   line(0,height*.3,900,height*.3);
   line(0,height*.4,900,height*.4);
   line(0,height*.5,900,height*.5);
   line(0,height*.6,900,height*.6);
   line(0,height*.7,900,height*.7);
   line(0,height*.8,900,height*.8);
   line(0,height*.9,900,height*.9);
 fill(255);
 textSize(15);
   text("10",20,height*.1);
   text("20",20,height*.2);
   text("30",20,height*.3);
   text("40",20,height*.4);
   text("50",20,height*.5);
   text("60",20,height*.6);
   text("70",20,height*.7);
   text("80",20,height*.8);
   text("90",20,height*.9);
   text("100",20,height);
 noStroke();
 fill(0,9,52,200);
    rect(0,0,width,height);
 fill(0,9,52,150);
    rect(600,0,width,height);
}

void prepBackground()
{
  imageMode(CORNER);
  image(water,0,0,width,height);
}


