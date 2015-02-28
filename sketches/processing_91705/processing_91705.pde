
//Laura Laham
//Homework # 5
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham
// If you hold down the mouse you can grow grass!
//If you press down any key, you can change the tint of the grass to make it darker for more shading.

PImage grass;

void setup()
{
  size(800,400);
  background(250,250,10);
    noStroke();
    fill(153,203,101);

  rect(0,height/2 + 100,width,height);
  smooth();
 grass = loadImage("Grass.png");
}

void draw()
{  

//pick a random location or have a vector or follow something
if (mousePressed){
figure();
}

}

void figure(){
  float x = random(0,1);
 pushMatrix();
 rotate(x);
if (keyPressed && key == 't')
{
  tint(random(0,10),random(0,10),random(0,10),random(150,250));
}
image(grass, mouseX + random(-50, 50), random(height/2, height-grass.height), random(60,100), random(height/4, height/2));
noTint();
 rotate(-x);
 popMatrix();

}

