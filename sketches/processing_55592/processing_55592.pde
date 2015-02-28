
void board (){



background (255);

int age =(millis()-stime)/1000;
int timeLeft= 24-age;

String s1 = "TIME "; //timer
String sc1 = s1 + timeLeft ; 
text (sc1,width/2-50, 100);

fill (245,17,17);
 




//red balls//////////////////////////
//1
if (b1==true){
ellipse ( 200, 100, random (45,50), random (45,50));
} else{
ellipse ( 200, 100, bw,bh);  
}

//2
if (b2==true){
ellipse ( 200, 400, random (45,50), random (45,50));
} else{
ellipse ( 200, 400, bw, bh);
}

//3
if (b3==true){
ellipse ( 100, 600, random (45,50), random (45,50));
} else{
ellipse (100, 600, bw, bh);
}

//4
if (b4==true){
ellipse ( 500, 200, random (45,50), random (45,50));
} else{
ellipse (500, 200, bw, bh);
}

//5
if (b5==true){
ellipse ( 400, 500, random (45,50), random (45,50));
} else{
ellipse ( 400, 500, bw, bh);
}

//6
if (b6==true){
ellipse ( 750, 150, random (45,50), random (45,50));
} else{ 
ellipse ( 750, 150, bw, bh);
}

//7
if (b7==true){
ellipse ( 700, 500, random (45,50), random (45,50));
} else{
ellipse ( 700, 500, bw, bh);
}

//8
if (b8==true){
ellipse ( 750, 750, random (45,50), random (45,50));
} else{
ellipse ( 750, 750, bw, bh);
}

fill (0);
rect (0, 250, 100, 20);// a
rect (150, 700, 100, 20);// b
rect (350, 350, 20, 100);// c
rect (650, 50, 20, 100);// d
rect (650, 350, 100, 20);// e
rect (600, 650, 20, 100);// f


  

}

