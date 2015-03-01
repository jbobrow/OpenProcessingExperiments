
float houseW = 250;
float cloud = random(0,20);
float cloudA = random(50,200);
float cloudB = random(500,800);

void setup(){
  size(1000,600);
}

//setting variables for the house and garage
//float houseW = 250;
void draw(){
  background(0,200,255);
  float houseH = houseW*.75;
  float offset = houseH/5;
  float houseX = width - (houseW+(offset*5));
  float houseY = height - (houseH+(offset*2));
  float hSideX1 = houseX+houseW; 
  float hSideY1 = houseY-(houseH*.4); 
  float hSideX2 = (houseX+houseW)+(.20*houseW);
  float hSideY2 = houseY-(.10*houseW);
  float hSideY3 = (houseY+houseH)-(.20*houseW);
  float hSideY4 = (houseY+houseH);
  float gSideX1 = houseX-(.167*houseW);
  float gSideY1 = houseY+(.167*houseW);
  float gSideX2 = houseX;
  float gSideY2 = houseY;
  float gSideY3 = houseY+houseH;
  float gSideY4 = (houseY+houseH)+(.167*houseW);
  float garageW = houseW*1.11;
  float garageH = houseH;
  float garageX = gSideX1-garageW;
  float garageY = gSideY1;
  float gRoofX2 = garageX+(garageW*.75);
  float gRoofY2 = garageY-(garageW*.36);
  float gQuadRoofX2 = houseX-(houseW*.08);
  float gQuadRoofY2 = houseY-(houseH*.4);
  float hRoofRight = hSideX1+(.02*houseW);
  float bRoofRight = hSideX2+(.02*houseW);
  float gDoorX = garageX+(.08*garageW);
  float gDoorY = garageY+(.18*garageH);
  float gDoorW = garageW-(.16*garageW);
  float gDoorH = garageH-(.18*garageH);
  float hDoorX = houseX+(.20*houseW);
  float hDoorW = .20*houseW;
  float hDoorH = .40*houseH;
  float hDoorY = (houseY+houseH)-hDoorH;
  float sWindowX1 = hSideX1 + (.04*houseW);
  float sWindowY1 = hSideY1 + (.35*houseW);
  float sWindowX2 = hSideX2 - (.04*houseW);
  float sWindowY2 = hSideY2 + (.075*houseW);
  float sWindowY3 = hSideY2 + (.22*houseW);
  float sWindowY4 = hSideY1 + (.505*houseW);
  float sBWindowY1 = sWindowY1+(.45*houseH);
  float sBWindowY2 = sWindowY2+(.425*houseH);
  float sBWindowY3 = sWindowY3+(.425*houseH);
  float sBWindowY4 = sWindowY4+(.45*houseH);
  
  fill(100,25,0,200);
  rect(houseX, houseY, houseW, houseH); 
  quad(hSideX1, hSideY1, hSideX2, hSideY2, hSideX2, hSideY3, hSideX1, hSideY4);
    
  //house door
  fill(255,225,255,200);
  stroke(0);
  rect(hDoorX, hDoorY, hDoorW, hDoorH);
  fill(50,50,0);
  rect(hDoorX+(.01*houseW), hDoorY+(.01*houseW), hDoorW-(.02*houseW), hDoorH-(.01*houseW));
  //door knob
  fill(255,255,0);
  ellipse((hDoorX+(.01*houseW))+(hDoorW*.15), hDoorY+(.55*hDoorH), hDoorW*.05, hDoorH*.05);
      
  //windows
  fill(255,255,0);
  quad(sWindowX1, sWindowY1, sWindowX2, sWindowY2, sWindowX2, sWindowY3, sWindowX1, sWindowY4);
  quad(sWindowX1, sBWindowY1, sWindowX2, sBWindowY2, sWindowX2, sBWindowY3, sWindowX1, sBWindowY4);  
    
  //Garage set up
  fill(100,25,0,200);
  rect(garageX, garageY, garageW, garageH);
  quad(gSideX1, gSideY1, gSideX2, houseY, houseX, gSideY3, gSideX1, gSideY4);
  
  //Garage Door
  fill(100,100,100);
  noStroke();
  rect(gDoorX, gDoorY, gDoorW, gDoorH);
      
  //Roof 
  noStroke();
  fill(65,20,0,250);
  triangle(garageX, garageY,gRoofX2, gRoofY2, gSideX1, gSideY1);
  quad(gRoofX2, gRoofY2, gQuadRoofX2, gQuadRoofY2, gSideX2, houseY, gSideX1, gSideY1);
  quad(gQuadRoofX2, gQuadRoofY2, hRoofRight, gQuadRoofY2, hRoofRight, houseY, houseX, houseY);
  quad(hRoofRight, gQuadRoofY2, bRoofRight, hSideY2, hSideX2, hSideY2+(houseW*.02), hRoofRight, (gQuadRoofY2+(houseW*.02)));
  
  //driveway
  fill(100,0,0);
  rect(gDoorX, gDoorY+gDoorH, gDoorW, height);
  
  //ground grass
  fill(50,150,0);
  rect(0,garageY+(.4*garageH),garageX, height);
  rect(garageX, garageY+garageH, .08*garageW, height);
  rect(garageX+(.92*garageW), garageY+garageH, width, height);
  quad(gSideX1, gSideY4, houseX, gSideY3, 1000, hSideY4, 1000, height);
  quad(hSideX1, hSideY4, hSideX2, hSideY3, 1000, hSideY3, 1000, height);
  rect(hSideX2, garageY+(.4*garageH),width, height);
  
  //clouds
  noStroke();
  fill(255,255,255,230);
  ellipse(cloud,45,45,45);
  ellipse(cloud+10,30,45,45);
  ellipse(cloud+20,50,50,50);
  ellipse(cloud+35,30,45,45);
  cloud = cloud+random(1.0,2.5);
  
  ellipse(cloudA,150,50,50);
  ellipse(cloudA+20,150,50,50);
  ellipse(cloudA+40,150,50,50);
  ellipse(cloudA+10,170,50,50);
  ellipse(cloudA+30,170,50,50);
  cloudA = cloudA+random(.5,1.5);
  
  ellipse(cloudB,100,56,56);
  ellipse(cloudB+20,100,56,56);
  ellipse(cloudB+30,120,56,56);
  ellipse(cloudB+10,120,56,56);
  ellipse(cloudB+30,125,56,56);
  ellipse(cloudB+50,90,56,56);
  ellipse(cloudB+70,90,56,56);
  ellipse(cloudB+40,140,56,56);
  ellipse(cloudB+70,140,56,56);
  cloudB = cloudB+random(.5,1.5);
  
  if(cloud>width+50){cloud=random(-160, -50);}
  if(cloudA>width+55){cloudA=random(-200,-100);}
  if(cloudB>width+61){cloudB=random(-350,-100);}
}
