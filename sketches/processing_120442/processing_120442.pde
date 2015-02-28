
int eSize = 3;  
smooth();             
fill(0);    
 

size(565, 400); 
background(255);
//background
for(int y = 0; y <= height; y +=30){   
  for(int x = 0; x <= width; x += 30){  
    ellipse(x, y, eSize, eSize);
  }
}

  
for(int y=15; y<=height; y+=30){
  for(int x=15; x<=width; x+=30){
 
    if(x < width/2 && y < height/2){  
      fill(x); 
    }    
    if(x >= width/2 && y < height/2){ 
      fill(y);  
    }
    if(x < width/2 && y >= height/2){   
      fill(512-y);  
    }    
    if(x >= width/2 && y >= height/2){ 
      fill(512-x);  
    }
 
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
  }
}

//left b
noStroke(); 
fill(0);
rect(10, 200, 120, 30);

noStroke(); 
fill(134,134,134);
rect(10, 50, 30, 150);

noStroke(); 
fill(255,36,7);
ellipse(145,215,30,30);

noStroke(); 
fill(0);
triangle(5, 50, 25, 17, 45, 50);

noStroke(); 
fill(255,36,7);
rect(10, 200, 30, 130);

noStroke(); 
fill(134,134,134);
rect(10, 300, 150, 30);

noStroke(); 
fill(255,36,7);
rect(100, 300,30, 30);

noStroke(); 
fill(134,134,134);
rect(130, 230,30, 100);

//center O
noStroke(); 
fill(0);
rect(210, 140,20, 150);

noStroke(); 
fill(255,36,7);
rect(300, 140,30, 150);

noStroke(); 
fill(0);
triangle(210, 140, 268, 100, 330, 140);

noStroke(); 
fill(255,36,7);
triangle(210, 290, 268, 330, 330, 290);




//right X
noStroke(); 
fill(0);
rect(382, 58,30, 30);

noStroke(); 
fill(134,134,134);
rect(385, 65,30, 30);

noStroke(); 
fill(255,36,7);
rect(388, 72,30, 30);

noStroke(); 
fill(0);
rect(391, 79,30, 30);

noStroke(); 
fill(134,134,134);
rect(394, 86,30, 30);

noStroke(); 
fill(255,36,7);
rect(397, 93,30, 30);

noStroke(); 
fill(0);
rect(400, 100,30, 30);

noStroke(); 
fill(134,134,134);
rect(403, 107,30, 30);

noStroke(); 
fill(255,36,7);
rect(406, 114,30, 30);

noStroke(); 
fill(0);
rect(409, 121,30, 30);

noStroke(); 
fill(134,134,134);
rect(412, 128,30, 30);

noStroke(); 
fill(255,36,7);
rect(415, 135,30, 30);

noStroke(); 
fill(0);
rect(418, 142,30, 30);

noStroke(); 
fill(134,134,134);
rect(421, 149,30, 30);

noStroke(); 
fill(255,36,7);
rect(424, 156,30, 30);

noStroke(); 
fill(0);
rect(427, 163,30, 30);

noStroke(); 
fill(134,134,134);
rect(430, 170,30, 30);

noStroke(); 
fill(255,36,7);
rect(433, 177,30, 30);

noStroke(); 
fill(0);
rect(436, 184,30, 30);

noStroke(); 
fill(134,134,134);
rect(439, 191,30, 30);

noStroke(); 
fill(255,36,7);
rect(442, 198,30, 30);

noStroke(); 
fill(0);
rect(445, 205,30, 30);

noStroke(); 
fill(134,134,134);
rect(448, 212,30, 30);

noStroke(); 
fill(255,36,7);
rect(451, 219,30, 30);

noStroke(); 
fill(0);
rect(454, 228,30, 30);

noStroke(); 
fill(134,134,134);
rect(457, 235,30, 30);

noStroke(); 
fill(255,36,7);
rect(460, 242,30, 30);

noStroke(); 
fill(0);
rect(463, 249,30, 30);

noStroke(); 
fill(134,134,134);
rect(466, 256,30, 30);

noStroke(); 
fill(255,36,7);
rect(469, 263,30, 30);

noStroke(); 
fill(0);
rect(472, 270,30, 30);

noStroke(); 
fill(134,134,134);
rect(475, 277,30, 30);

noStroke(); 
fill(255,36,7);
rect(478, 284,30, 30);

noStroke(); 
fill(0);
rect(481, 291,30, 30);

noStroke(); 
fill(134,134,134);
rect(484, 298,30, 30);

noStroke(); 
fill(255,36,7);
rect(487, 305,30, 30);

noStroke(); 
fill(0);
rect(490, 312,30, 30);








noStroke(); 
fill(0);
rect(488, 58,30, 30);

noStroke(); 
fill(134,134,134);
rect(485, 65,30, 30);


noStroke(); 
fill(255,36,7);
rect(482, 72,30, 30);

noStroke(); 
fill(0);
rect(479, 79,30, 30);

noStroke(); 
fill(134,134,134);
rect(476, 86,30, 30);

noStroke(); 
fill(255,36,7);
rect(473, 93,30, 30);

noStroke(); 
fill(0);
rect(470, 100,30, 30);


noStroke(); 
fill(134,134,134);
rect(467, 107,30, 30);

noStroke(); 
fill(255,36,7);
rect(464, 114,30, 30);

noStroke(); 
fill(0);
rect(461, 121,30, 30);

noStroke(); 
fill(134,134,134);
rect(458, 128,30, 30);

noStroke(); 
fill(255,36,7);
rect(455, 135,30, 30);

noStroke(); 
fill(0);
rect(452, 142,30, 30);

noStroke(); 
fill(134,134,134);
rect(449, 149,30, 30);

noStroke(); 
fill(255,36,7);
rect(446, 156,30, 30);

noStroke(); 
fill(0);
rect(443, 163,30, 30);

noStroke(); 
fill(134,134,134);
rect(440, 170,30, 30);

noStroke(); 
fill(255,36,7);
rect(437, 177,30, 30);

noStroke(); 
fill(0);
rect(434, 184,30, 30);

noStroke(); 
fill(134,134,134);
rect(431, 191,30, 30);

noStroke(); 
fill(255,36,7);
rect(428, 198,30, 30);

noStroke(); 
fill(0);
rect(425, 205,30, 30);

noStroke(); 
fill(134,134,134);
rect(422, 212,30, 30);

noStroke(); 
fill(255,36,7);
rect(419, 219,30, 30);

noStroke(); 
fill(0);
rect(416, 228,30, 30);

noStroke(); 
fill(134,134,134);
rect(413, 235,30, 30);

noStroke(); 
fill(255,36,7);
rect(410, 242,30, 30);

noStroke(); 
fill(0);
rect(407, 249,30, 30);

noStroke(); 
fill(134,134,134);
rect(404, 256,30, 30);

noStroke(); 
fill(255,36,7);
rect(401, 263,30, 30);

noStroke(); 
fill(0);
rect(398, 270,30, 30);

noStroke(); 
fill(134,134,134);
rect(395, 277,30, 30);

noStroke(); 
fill(255,36,7);
rect(392, 284,30, 30);

noStroke(); 
fill(0);
rect(389, 291,30, 30);

noStroke(); 
fill(134,134,134);
rect(386, 298,30, 30);

noStroke(); 
fill(255,36,7);
rect(383, 305,30, 30);

noStroke(); 
fill(0);
rect(380, 312,30, 30);





















