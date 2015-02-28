
//Isaiah Baiseri
//Project 1
 
float v;
PImage img;
 
void setup() {
  
  size(500, 500);
  smooth();
  noStroke();
  rectMode(CENTER);
  img = loadImage("dollar signs.png");
  
}
 
void draw() {
  
  //background color change
  float bgR = map(v, 0, 500, 142, 92);
  float bgG = map(v, 0, 500, 142, 194);
  float bgB = map(v, 0, 500, 142, 177);
  background(bgR, bgG, bgB); //92, 194, 177
   
  v = mouseX;
  
  //hairColor change
  float hairColorR = map(v, 0, 500, 108, 241); //changes hair color RED value
  float hairColorG = map(v, 0, 500, 76, 214); //changes hair color GREEN value
  float hairColorB = map(v, 0, 500, 30, 22); //changes hair color BLUE value
  
  //skinColor change
  float skinColorG = map(v, 0, 500, 229, 216); //changes hair color GREEN value
  float skinColorB = map(v, 0, 500, 205, 168); //changes hair color BLUE value
  
  //hair growth
  float backHairHeight = map(v, 0, 500, 110, 295); //grows hair from back
  float backHairCenterY = map(v, 0, 500, 284, 365); //moves back hair center downward
  
  //shirtColor change
  float shirtColorR = map(v, 0, 500, 0, 92); //changes shirt color RED value
  float shirtColorG = map(v, 0, 500, 0, 194); //changes shirt color GREEN value
  float shirtColorB = map(v, 0, 500, 0, 177); //changes shirt color BLUE value
  
  //"weight loss"
  float leftShoulderCenterX = map(v, 0, 500, 180, 206); //moves leftShoulder rightward
  float chestWidth = map(v, 0, 500, 142, 111); //decreases chest width
  float rightShoulderCenterX = map(v, 0, 500, 320, 295); //moves rightShoulder leftward
  float cleavageWidth = map(v, 0, 500, 140, 110); //reduces cleavage width
  float cleavageHeight = map(v, 0, 500, 140, 170); //increases cleavage height
  
  //"lip augmentation"
  float lipColorR = map(v, 0, 500, 247, 238); //changes lipColor RED value
  float lipColorG = map(v, 0, 500, 174, 55); //changes lipColor GREEN value
  float lipColorB = map(v, 0, 500, 174, 63); //changes lipColor BLUE value
  
  float lowerLipWidth = map(v, 0, 500, 50, 140); //increases lowerLip width
  float lowerLipHeight = map(v, 0, 500, 30, 70); //increases lowerLip height
  
  float upperLipWidth = map(v, 0, 500, 26, 75); //increases upperLip width
  float upperLipHeight = map(v, 0, 500, 22, 52); //increases upperLip height
  
  float upperLipLeftX = map(v, 0, 500, 238, 217); //shift upperLipLeftX
  float upperLipLeftY = map(v, 0, 500, 342, 344); //shift upperLipLeftY
  
  float upperLipRightX = map(v, 0, 500, 262, 283); //shift upperLipRightX
  float upperLipRightY = map(v, 0, 500, 342, 344); //shift upperLipRightY
  
  //"red eyes"
  float eyeWhiteColorR = map(v, 0, 500, 255, 253); //changes eyeWhiteColor RED value
  float eyeWhiteColorG = map(v, 0, 500, 255, 223); //changes eyeWhiteColor GREEN value
  float eyeWhiteColorB = map(v, 0, 500, 255, 223); //changes eyeWhiteColor BLUE value
  
  float pupilDiameter = map(v, 0, 500, 5, 11); //dilates pupils
  
  float leftPupilCenterX = map(v, 0, 500, 202, 220); //shifts left pupil rightward
  float rightPupilCenterX = map(v, 0, 500, 298, 280); //shifts right pupil leftward
  
  //"eye shadow"
  float eyelidColorR = map(v, 0, 500, 239, 92); //changes eyelidColor RED value
  float eyelidColorG = map(v, 0, 500, 212, 194); //changes eyelidColor GREEN value
  float eyelidColorB = map(v, 0, 500, 182, 177); //changes eyelidColor BLUE value
  
  //"blush"
  float blushOpacity = map(v, 0, 500, 64, 255); //changes blush alpha
  float blushWidth = map(v, 0, 500, 42, 60);
  float blushHeight = map(v, 0, 500, 20, 30);
  
  //dollar sign fade
  float dollarSignAlpha = map(v, 0, 500, 0, 255);
  
  //DRAW
 
  //dollar sign bg
  tint(255, dollarSignAlpha);
  image(img, 0, 0);
 
  //back hair
  fill(hairColorR, hairColorG, hairColorB);
  noStroke();
  rect(250, backHairCenterY, 320, backHairHeight);
   
  //shirt
  fill(shirtColorR, shirtColorG, shirtColorB);
  arc(leftShoulderCenterX, 500, 180, 180, PI, PI+HALF_PI); //leftShoulder
  rect(250, 457, chestWidth, 89); //chest
  arc(rightShoulderCenterX, 500, 180, 180, PI+HALF_PI, TWO_PI); //rightShoulder
  
  //neck+cleavage
  fill(246, skinColorG, skinColorB);
  rect(250, 400, 90, 40); //neck
  arc(250, 410, cleavageWidth, cleavageHeight, 0, PI); //cleavage
  
  //ears+head
  ellipse(110, 270, 30, 30); //left ear
  ellipse(390, 270, 30, 30); //right ear
  ellipse(250, 230, 280, 350); //head
  
  //top hair (bangs)
  fill(hairColorR, hairColorG, hairColorB); //hair color
  arc(250, 230, 320, 351, PI, TWO_PI); //hair top
  fill(246, skinColorG, skinColorB); //skin color
  triangle(228, 232, 250, 190, 272, 232); //hair bangs part
  
  //lips+mouth
  fill(lipColorR, lipColorG, lipColorB);
  arc(250, 341, lowerLipWidth, lowerLipHeight, 0, PI); //lower
  arc(upperLipLeftX, upperLipLeftY, upperLipWidth, upperLipHeight, PI, TWO_PI); //upper left
  arc(upperLipRightX, upperLipRightY, upperLipWidth, upperLipHeight, PI, TWO_PI); //upper right
  fill(0);
  arc(250, 341, lowerLipWidth*.8, lowerLipHeight/2.5, 0, PI); //open mouth
  
  //eyes
  fill(eyeWhiteColorR, eyeWhiteColorG, eyeWhiteColorB, 200);
  ellipse(202, 260, 52, 35); //left eye white
  ellipse(298, 260, 52, 35); //right eye white
  fill(0, 161, 75);
  ellipse(leftPupilCenterX, 260, 15, 15); //left eye green
  ellipse(rightPupilCenterX, 260, 15, 15); //right eye green
  fill(0);
  ellipse(leftPupilCenterX, 260, pupilDiameter, pupilDiameter); //left eye pupil
  ellipse(rightPupilCenterX, 260, pupilDiameter, pupilDiameter); //right eye pupil
  
  //eyelids
  fill(eyelidColorR, eyelidColorG, eyelidColorB);
  arc(202, 257, 52, 32, PI, TWO_PI); //left eyelid
  arc(298, 257, 52, 32, PI, TWO_PI); //right eyelid
  
  //blush
  fill(247, 174, 174, blushOpacity); //blush color ¡OPAQUE!
  ellipse(169, 295, blushWidth, blushHeight); //left cheek
  ellipse(331, 295, blushWidth, blushHeight); //right cheek
  
  //nose
  fill(0);
  ellipse(243, 302, 11, 4); //left nostril
  ellipse(257, 302, 11, 4); //left nostril
  
}

