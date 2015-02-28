

void setup()
{
 size(400,600);
  background(250);
}

void draw()
{
println(mouseX);
println(mouseY);



//Première Ligne +120 en x


triangle (10,100,65,10,120,100);
line(65,100,65,10);
line(65,100,93,55);
line(65,100,38,55);
triangle (130,100,185,10,240,100);
line(185,100,185,10);
line(185,100,212,55);
line(185,100,156,55);
line(185,100,227,79);
line(185,100,143,79);
line(185,100,200,34);
line(185,100,170,34);
triangle (250,100,305,10,360,100);
line(305,100,305,10);
line(305,100,333,55);
line(305,100,278,55);
line(305,100,347,79);
line(305,100,263,79);
line(305,100,320,34);
line(305,100,290,34);
line(305,100,313,23);
line(305,100,298,23);
line(305,100,284,46);
line(305,100,327,46);
line(305,100,271,66);
line(305,100,339,66);
line(305,100,258,89);
line(305,100,354,89);

//Deuxième ligne +100 en y  et +120 en x

strokeWeight(3);
triangle (10,200,65,110,120,200); 
strokeWeight(6);
triangle (130,200,185,110,240,200);
strokeWeight(9);
triangle (250,200,305,110,360,200); 
strokeWeight(0);

//Troisième ligne +100 en y  et +120 en x

noStroke();
fill(0);
triangle (10,300,65,210,120,300);
fill(60);
triangle (130,300,185,210,240,300);
fill(100);
triangle (250,300,305,210,360,300);
noFill();
stroke(0);
//Quatrieme ligne +100 en y  et +120 en x

strokeWeight(2);
triangle (10,400,65,310,120,400); 
line(23,400,72,322);
line(37,400,79,333);
line(51,400,85,344);
line(65,400,93,355);
line(79,400,99,366);
line(93,400,106,377);
line(107,400,113,388);
strokeWeight(0);
strokeWeight(0);
line(120,400,58,322);
line(120,400,51,333);
line(120,400,44,344);
line(120,400,36,355);
line(120,400,30,366);
line(120,400,23,377);
line(120,400,17,388);
strokeWeight(0);

strokeWeight(4);
triangle (130,400,185,310,240,400);
line(145,400,193,322);
line(159,400,199,333);
line(173,400,206,344);
line(187,400,213,355);
line(201,400,220,366);
line(215,400,226,377);
line(229,400,233,388);
strokeWeight(0);
strokeWeight(0);
line(240,400,178,322);
line(240,400,172,333);
line(240,400,165,344);
line(240,400,158,355);
line(240,400,151,366);
line(240,400,144,377);
line(240,400,138,388);
strokeWeight(0);

strokeWeight(6);
triangle (250,400,305,310,360,400); 
line(265,400,313,322);
line(279,400,319,333);
line(293,400,326,344);
line(307,400,333,355);
line(321,400,340,366);
line(335,400,346,377);
line(349,400,353,388);
strokeWeight(0);
strokeWeight(0);
line(360,400,298,322);
line(360,400,291,333);
line(360,400,284,344);
line(360,400,278,355);
line(360,400,271,366);
line(360,400,264,377);
line(360,400,257,388);
strokeWeight(0);

//Cinquieme ligne

line(20,485,57,425);
line(111,485,74,425);
line(24,500,104,500);
bezier(57,425,63,422,69,422,74,425);
bezier(20,485,18,491,20,498,24,500);
bezier(111,485,112,491,109,497,104,500);
//triangle (10,500,65,410,120,500); 
line(149,469,168,437);
line(201,437,221,470);
line(164,500,207,500);
bezier(168,437,178,432,191,431,201,437);
bezier(221,470,223,481,218,494,207,500);
bezier(164,500,154,494,148,480,149,469);
//triangle (130,500,185,410,240,500); 
ellipse(305,465,40,40);
//triangle(250,500,305,410,360,500); 


}


