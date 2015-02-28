
void setup () {
size (1197,1188);
background (253,254,246);
}
void draw() { 




//YELLOW RECTS

noStroke();
fill(254,255,0); 
rect (0,910,165,305);//yellow left corner
rect (749,0,410,455);//yellow right corner 




//RED RECTS

fill(255,0,0); 
rect (146,123,605,650);//big one
rect (1139,909,127,290);//small right corner




//BLUE RECT

fill(0,0,255); 
rect (760,920,390,210);




//BLACK RECTS

fill(0);
rect (150,760,300,305);
rect (450,1055,301,84);

//HORIZONTAL BLACK LINES MADE BY RECT

stroke(0);
fill(0);
rect (24,120,1127,19);//horizontal 1
rect (24,452,123,19);//horizontal 2
rect (759,452,395,19);//horizontal 2.2
rect (146,756,1000,19);//horizontal 3
rect (24,909,123,19);//horizontal 4
rect (440,909,760,19);//horizontal 4.2
rect (440,1120,718,19);//horizontal 4.3
rect (146,1055,621,19);//horizontal 5

//VERTICAL BLACK LINES MADE BY RECT

rect (146,123,19,1000);//vertical 1
rect (1139,18,19,1105);//vertical 2
rect (440,760,19,370);//vertical 3
rect (749,18,19,1105);//vertical 4
rect (945,454,19,309);//vertical 5
rect (1139,18,19,1200);//vertical 6 

}

