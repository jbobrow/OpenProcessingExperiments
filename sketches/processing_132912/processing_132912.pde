
size(400, 400);
background(60, 80, 100);
smooth();

//define first variables
int a = 25;
int b = 25;

//begin nested for loop (ellipse)
for(int i = -17; i <= 400; i += 40){
  for(int j = -17; j <= 400; j += 40){
    fill(152, 19, 94);
    ellipse(i, j, a, b);
  }
}

//begin nested for loop (rect)
for(int k = 0; k <= 400; k += 20){
  for(int l = 0; l <= 400; l += 20){
    fill(255, 65);
    rect(k, l, a, b);
  }
}

//begin outer chikara
strokeWeight(20);
stroke(255, 203, 250);
noFill();

int c = 20;
//using freehand shape create function
//as best available way to permanently draw chikara
beginShape();
vertex(54+c, 329);
vertex(114+c, 292);
vertex(153+c, 241);
vertex(175+c, 139);
vertex(58+c, 139);
vertex(175+c, 139);
vertex(178+c, 56);
vertex(175+c, 139);
vertex(291+c, 139);
vertex(289+c, 233);
vertex(283+c, 287);
vertex(270+c, 311);
vertex(250+c, 329);
vertex(201+c, 329);
endShape();

//begin inner chikara
strokeWeight(6);
stroke(152, 6, 109);
noFill();
beginShape();
vertex(54+c, 329);
vertex(114+c, 292);
vertex(153+c, 241);
vertex(175+c, 139);
vertex(62+c, 139);
vertex(175+c, 139);
vertex(178+c, 60);
vertex(175+c, 139);
vertex(291+c, 139);
vertex(289+c, 233);
vertex(283+c, 287);
vertex(270+c, 311);
vertex(250+c, 329);
vertex(201+c, 329);
endShape();


