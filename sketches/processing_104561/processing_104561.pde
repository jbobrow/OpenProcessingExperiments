
void setup() 
{ 
size(512,508);
} 
void draw() 
{ 
smooth(); 
float ax=random(230,255); 
background(ax);

fill(#FFD129,200);
noStroke();
rect(317,0,492-317,188);
rect(0,384,58,508-384);

strokeWeight(7);
stroke(0);
line(9,189,488,189);

fill(234,29,29);
noStroke();
rect(58,58,262,260);
rect(485,388,512-485,508-388);

fill(0);
rect(58,320,188-58,446-320);
rect(188,446,317-188,481-446);

fill(#1210C9,200);
rect(317,385,485-317,483-385);

strokeWeight(7);
stroke(0);
line(9,60,488,60);
line(58,319,488,319);
line(9,387,512,387);
line(55,60,55,493);
line(58,446,314,446);
line(192,480,483,480);
line(121,10,121,56);
line(191,322,191,500);
line(320,10,320,480);
line(404,189,404,318);
line(489,15,489,500);


}
