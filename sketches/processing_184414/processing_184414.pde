
//file:///Applications/Processing%203.app/Contents/Java/modes/java/reference/box_.html
//week 1 - assignment 
a = 0; // initilized varible a
color c = color(185, 50, 90); //set up the color of the shape

void setup(){
size (250,250,P3D); // size of the sketch in 3D
background(51); // set background color to black
}

void draw() // main loop for draw
{
fill(c);// fill color into the shape
translate(a, a, a); // size of the 3D box  
rotateY(0.7); // set up the rotation of the 3D box
box(40); // Box size
rect(a,a,a,a); // 
    a = a + 5;
    a = a%250;
 
 println(a);
    
}
