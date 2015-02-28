
//Ale González, 2013, Pubic Domain
// A tile generator using a truchet tiling as revised by Cyril Stanley Smith
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: none");

int s = 35, S = 700, x, y, m = 0; 
float nd, ONE_HALF_PI = PI + HALF_PI;

size(700, 700);
noFill();
noLoop();

void mouseClicked() { m = mouseX; redraw(); }

void draw() 
{
    background(-1);
    for (y = 0; y<S; y+=s) for (x = 0; x<S; x+=s) 
    {
        if (random(S) < m) {           
            arc(x, y, s, s, 0, HALF_PI);
            arc(x+s, y+s, s, s, -PI, -HALF_PI);
        } else {
            arc(x+s, y, s, s, HALF_PI, PI);
            arc(x, y+s, s, s, ONE_HALF_PI, TWO_PI);
        }        
    }
}
