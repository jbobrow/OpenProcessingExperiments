
//Laura Laham
//Homework # 9
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham


int width = 200;
int height = 200;

int[] posX = {
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width), 
  (int)random(0, width)
  };

int[] posY = {
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height), 
  (int)random(0, height)
  };

int[] siz = {
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40), 
  (int)random(10, 40)
  };

color[] col = { 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255))
};

void setup() {
  background(32,48,50);
  smooth();
  noStroke();
size(width,height);
   for (int i = 0; i < 10; i++) {
    fill(col[i]);
    ellipse(posX[i], posY[i], siz[i], siz[i]);
  }

}
