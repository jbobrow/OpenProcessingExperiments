


void setup(){
  size(1000,1000);

}
void draw(){
  background(255); 
  
rect(300,600,300,300);

rect(348,490,25,50);
quad(300,600,375,500,525,500,600,600);

rect(425,800,50,100);
ellipse(465,855,5,5);

rect(325,800,75,75);
line(362,800,362,874);
line(325,820,400,820);

rect(325,650,75,75);
line(362,650,362,724);
line(325,670,400,670);

rect(500,800,75,75);
line(537,800,537,874);
line(500,820,575,820);

rect(500,650,75,75);
line(537,650,537,724);
line(500,670,575,670);

rect(600,700,250,200);
rect(625,725,200,175);
for (int i=900; i>725; i=i-25) {
  line(625, i, 825, i);
}


if(mouseX>445){
  if(mouseX<825){
    fill(0);
    for(int i=875; i>725; i=i-25){
    rect(625,i,200,25);
  }}};
fill(255);
quad(mouseX,860,mouseX+30,820,mouseX+155,820,mouseX+180,860);
rect(mouseX,860,180,30);
line(mouseX+30,820,mouseX+30,860);
line(mouseX+155,820,mouseX+155,860);
ellipse(mouseX+30,885,30,30);
ellipse(mouseX+155,885,30,30);




}






