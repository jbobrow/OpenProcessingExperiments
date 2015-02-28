
int[] females = {1044,468,1030,1168,1051,2638,1455,457,2194};
int[] males = {1044,2417,549,2896,83,1843,1894,3093,1754};
string[] coll= {"Concurrent Enrollment","Aviation and Public Services", "Arts", "Business", "Education", "Humanities and Social Science", "Science and Health", "Technololgy and Computing", "University College"};
void setup(){
size(600, 600);
textAlign(CENTER,CENTER);
}

void draw(){
scale(.75);
background(255);
fill(0,255);
textSize(24);
text("UVU Colleges: Majors by Gender, Spring 2013",400,30);
noStroke();
   fill(224,101,101,255);
   rect (20,100,100,20);
   fill(59,89,152,255);
   rect (20,130,100,20);
   fill (0);
   textSize(16);
   text ("Female",70,110);
   fill (255);
   text ("Male",70,140);
   
   
translate(400,400);
//stroke(0,100);
strokeWeight(1);

for (int r=10; r>0; r--){
   if (int(r/2)==r/2) {fill(0,30);} else {fill(255,30);}
   ellipse(0,0,60+(r*500)/7.5,60+(r*500)/7.5);
}
noStroke();

for (int i=0; i<9; i++){
   textSize(12);
   fill(224,101,101,255);  
   rect (30,-10,females[i]/15,20);
   fill (0,255);
   text (int(females[i]/(females[i]+males[i])*100+.5)+"%",30+females[i]/30,0);
   fill(59,89,152,255);
   rect (30+females[i]/15,-10,males[i]/15,20);
   fill (255,255);
   text (int(males[i]/(females[i]+males[i])*100+.5)+"%",30+females[i]/15+males[i]/30,0);
   rotate (HALF_PI);
   fill (0,255);
   textSize(16);
   text (int(males[i]+females[i]),0,-(males[i]/15+females[i]/15+45));
   text (coll[i],0,-(males[i]/15+females[i]/15+65));
   rotate (-HALF_PI);
   rotate (-(PI*2)/9);
}

}
