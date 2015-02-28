
//Copyright Miranda Jacoby 2014 All Rights Reserved


size(400, 400);

float x = 40;
float y = 40;
float wd = 400;
float ht = 400;

stroke(5);
beginShape();
curveVertex(x, y);
curveVertex( .15 * wd + x, .15 * ht + y);
curveVertex(.25 * wd + x, .5 * ht + y);
curveVertex(.35 * wd + x, .35 * ht + y);
curveVertex( .5 * wd + x, y);

curveVertex( .10 * wd + x, .10 * ht + y);
curveVertex(x, y);
curveVertex(.13 * wd + x, .13 * ht + y);
curveVertex( .17 * wd + x, .17 *ht + y);
curveVertex(.30 * wd + x, .5 * ht + y);
curveVertex(.25 * x, .6 * ht + y);

endShape(CLOSE);


