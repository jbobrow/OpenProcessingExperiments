

void main() {  
// Based on original by SPORTSBOSS 314
// https://www.khanacademy.org/cs/drummer/6586586242744320

var draw = function() {
    background(random(255),random(255),random(255));
    
    var x = cos(millis()*1); 
    var y = cos(millis()+98);
    
    // face
    image(getImage("avatars/spunky-sam"),x+177, x+101,50, 50);
    
    // body
    strokeWeight(2);
    line(202, 213, x+203, x+150);
    line(x+220, x*20+266, 202, 213);
    line(x+188, x*2+266, 202, 213);
    line(x+167, x*20+150, 204, 169);
    line(y+164,y*20+148,204, 168);
    
    // drum set
    strokeWeight(3);
    fill(255, 255, 255);
    fill(random(255),random( 255),random(255));
    stroke(random(255),random(255),random(255) );
    ellipse(162, 176, 54, 15);
    line(161, 264, 161, 183);
    line(134, 275, 162, 255);
    line(185, 275,162, 257);
    ellipse(226, 268, 65, 65);
    ellipse(226, 268, 60, 60);
};
};
