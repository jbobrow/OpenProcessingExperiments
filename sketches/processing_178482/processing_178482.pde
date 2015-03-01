
int body = 200;
int head = 250;
int arms = 70;
int eyes = 300;


void setup () {
size(400,400);
background(#81FFFE);
}

 
void draw (){
ellipseMode(CENTER);
fill(#FCB8F8);
ellipse(body,350,arms,100);
line(body,eyes,head,240);
line(body,eyes,150,240);
fill(#FAAA0A);
ellipse(200,eyes,60,30);
fill(#FCB8F8);
ellipse(head,350,arms,80);
fill(#FCB8F8);
//ellipse(

body = body - 2;
head = head - 2;
arms = arms - 2;
eyes = eyes - 2;
}

