
/* PerceptronDemo.pde
 *
 * Copyright 2013, 2014 Roland Richter.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/** Interactive demonstration of the Perceptron algorithm.
 */

// In literature on the Perceptron algorithm, a data sample point is
// usually denoted by X in R^n, and its label is denoted by Y in {-1,+1}.
// In this demo, data sample points are restricted to two-dimensional real
// vectors, and are represented as two different sets P (positive, i.e.
// with label = +1), and N (negative, i.e. label = -1).

ArrayList<Vector2d> Ps;
ArrayList<Vector2d> Ns;


// The Perceptron class.
class Perceptron
{
    // The separating line which is to be found by the Perceptron algorithm
    // is given by the normal vector w (weights) and the offset b (bias).
    // The expression
    //      w.x * u.x + w.y * u.y + b
    // should be positive for all u in Ps, and negative for u in Ns.

    private Vector2d w;
    private float b;
    private float eps;


    Perceptron(float epsilon) {
        eps = epsilon;
    }


    void setWeights(Vector2d newW) {
        w = newW;
    }


    Vector2d weights() {
        return w;
    }


    void setBias(float newB) {
        b = newB;
    }


    float bias() {
        return b;
    }


    // Evaluates point u w.r.t. the Percetrons weights and bias.
    float evaluate(Vector2d u) {
        return dot(w, u) + b;
    }


    void initialize(ArrayList<Vector2d> neg, ArrayList<Vector2d> pos) {
        Vector2d sumNeg = new Vector2d(0., 0.);

        for (int k = 0; k < neg.size(); ++k) {
            sumNeg = add(sumNeg, neg.get(k));
        }

        Vector2d sumPos = new Vector2d(0., 0.);

        for (int k = 0; k < pos.size(); ++k) {
            sumPos = add(sumPos, pos.get(k));
        }

        Vector2d avgN = mult(1. / (float)neg.size(), sumNeg);
        Vector2d avgP = mult(1. / (float)pos.size(), sumPos);

        Vector2d mean = mult(1. / (float)(neg.size() + pos.size()),
                             add(sumNeg, sumPos));

        w = sub(avgP, avgN);
        b = -dot(w, mean);

        normalizeTo(10.);
    }

    // Returns a list of the number of
    // true negatives, false negatives, false positives, and true positives.
    ArrayList<Integer> getConfusionMatrix(ArrayList<Vector2d> neg, ArrayList<Vector2d> pos) {        
        int tn = 0; int fn = 0; int fp = 0; int tp = 0;
        
        for (int k = 0; k < neg.size(); ++k) {
            if (evaluate(neg.get(k)) < 0.) {
                ++tn;
            } else {
                ++fp;
            }
        }
        
        for (int k = 0; k < pos.size(); ++k) {
            if (evaluate(pos.get(k)) < 0.) {
                ++fn;
            } else {
                ++tp;
            }
        }
        
        ArrayList<Integer> cf = new ArrayList<Integer>();

        cf.add(tn);
        cf.add(fn);
        cf.add(fp);
        cf.add(tp);
        
        return cf;
    }

    void normalizeTo(float newMag) {
        float mag = magn(w);
 
        if (mag > 0) {
            w = mult(newMag/mag, w);
            b = (newMag/mag) * b; 
        }
    }


    boolean update(Vector2d u, float label) {
        // The two error cases
        // label == -1 && w . u + b >= 0 (an N was wrongly classified as P), and
        // label == +1 && w . u + b <= 0 (an P was wrongly classified as N)
        // can be summarized as
        float delta = -label * evaluate(u);
        // which is positive if and only if the classification is wrong.

        if (delta >= 0) {
            // The Perceptron is often formulated with the update rule
            // w += label * u;
            // b += label;
            // which would be equivalent to set our lambda value to
            // float lambda = 1.;
            // However, one might also choose other values for lambda.
            // The following choice (for any eps being positive),
            float lambda = (delta + eps) / (u.x * u.x + u.y * u.y + 1);
            // has the property that, after updating, w . u + b is _exactly_ eps.

            w.x += label * lambda * u.x;
            w.y += label * lambda * u.y;
            b += label * lambda;

            normalizeTo(10.);

            return true;
        } else {
            return false;
        }
    }


    boolean updateWithTolerance(Vector2d u, float label, float tolerance) {
        // Calculate delta as above; this time, however, only update
        // if delta is "quite large", i.e. if it exceeds the tolerance.
        // This makes only sense if w, b are normalized.
        normalizeTo(10.);
        
        float delta = -label * evaluate(u);

        if (delta >= tolerance) {
            float lambda = (delta + eps) / (u.x * u.x + u.y * u.y + 1);

            w.x += label * lambda * u.x;
            w.y += label * lambda * u.y;
            b += label * lambda;

            normalizeTo(10.);

            return true;
        } else {
            return false;
        }
    }


    void learn(ArrayList<Vector2d> neg, ArrayList<Vector2d> pos) {
        learnByLists(neg, pos);
    }


    private void learnByRandom(ArrayList<Vector2d> neg, ArrayList<Vector2d> pos) {
        // Learn for a "long" time until (hopefully) finished
        for (int t = 0; t < 1000000; ++t) {

            // Take either a negative or positive sample at random
            float label = (random(1) < 0.5 ? -1 : +1);
            Vector2d u;

            if (label > 0) {
                int r = int(random(pos.size()));
                u = pos.get(r);
            } else {
                int r = int(random(neg.size()));
                u = neg.get(r);
            }

            if (update(u, label)) {
                println("Step " + t + " => " + w.x + " " + w.y + " " + b);
            }
        }
    }


    private void learnByLists(ArrayList<Vector2d> neg, ArrayList<Vector2d> pos) {
        // Create lists of indices of wrongly classified samples
        ArrayList<Vector2d> wrongNeg = new  ArrayList<Vector2d>();
        ArrayList<Vector2d> wrongPos = new  ArrayList<Vector2d>();

        for (int k = 0; k < neg.size(); ++k) {
            if (evaluate(neg.get(k)) > 0) {
                wrongNeg.add(neg.get(k));
            }
        }

        for (int k = 0; k < pos.size(); ++k) {
            if (evaluate(pos.get(k)) < 0) {
                wrongPos.add(pos.get(k));
            }
        }

        int t = 1;
        float tol = 0.;

        // As long as there are wrongly classified negative or positive samples,
        // update the Perceptron with one of them, then recompute the lists.
        while (wrongNeg.size() > 0 || wrongPos.size() > 0) {

            float label;

            // If no negative samples are wrong, take a positive one
            if (wrongNeg.size() == 0) {
                label = +1;
            }
            // If no positve samples are wrong, take a negative one
            else if (wrongPos.size() == 0) {
                label = -1;
            }
            // Otherwise, take either a negative or positive one
            else {
                label = (random(1) < 0.5 ? -1 : +1);
            }

            Vector2d u;

            if (label > 0) {
                int r = int(random(wrongPos.size()));
                u = wrongPos.get(r);
            } else {
                int r = int(random(wrongNeg.size()));
                u = wrongNeg.get(r);
            }

            // First, learn with no tolerance; if not finished after
            // some time, start to use tolerance, and increase it slowly.
            if (t < 10 * (neg.size() + pos.size())) {
                tol = 0.;
            } else {
                tol = (float)sqrt(t - 10. * (neg.size() + pos.size()));
            }

            if (updateWithTolerance(u, label, tol)) {
                println("Step " + t + " (" + tol + ") => " 
                        + w.x + " " + w.y + " " + b);
            }

            // Recompute the lists
            wrongNeg.clear();
            wrongPos.clear();

            for (int k = 0; k < neg.size(); ++k) {
                if (evaluate(neg.get(k)) > tol) {
                    wrongNeg.add(neg.get(k));
                }
            }

            for (int k = 0; k < pos.size(); ++k) {
                if (evaluate(pos.get(k)) < -tol) {
                    wrongPos.add(pos.get(k));
                }
            }

            ++t;
        }
        
        println("Finished with tolerance " + tol + ": " + w.x + " " + w.y + " " + b);
    }


    void moveToSeparator(Vector2d u) {
        float l = (-b - dot(w, u)) / magnSq(w);
        u.x += l * w.x;
        u.y += l * w.y;
    }
}


Perceptron perceptron = new Perceptron(100.);

Vector2d M = new Vector2d(50., 50.);


// The left, right, top, and botton screen limits in worlds coordinates.
final float worldLeft   =  -10.0;
final float worldRight  = +130.0;
final float worldTop    = +110.0;
final float worldBottom =  -10.0;

boolean showLineEq = true;

// Indicates which point was left-clicked, if any.
int leftclickedState = 0; // 0: no click, -1: an N was clicked; +1: a P was clicked
int leftclickedIndex;     // Index of left-clicked point, if leftclickedState != 0

// Indicates which point was right-clicked, if any.
int rightclickedState = 0; // 0: no click, -1: an N was clicked; +1: a P was clicked
int rightclickedIndex;     // Index of the right-clicked point, if rightclickedState != 0

boolean mouseDragsM = false;
boolean mouseDragsW = false;


// Converts screen to world coordinates.
Vector2d screen2world(int x, int y)
{
    return new Vector2d(map(x, 0, width,  worldLeft, worldRight),
                        map(y, 0, height, worldTop,  worldBottom));
}


// Converts world to screen coordinates.
Vector2d world2screen(Vector2d p)
{
    return new Vector2d(map(p.x, worldLeft, worldRight,  0, width),
                        map(p.y, worldTop,  worldBottom, 0, height));
}


// Formats a float with 1 digit after the comma.
String format1(float v)
{
    int width = max(floor(log(v) / log(10)), 1);
    return nfp(v, width, 1);
}



// Use one of three different scenarios to generate random samples.
// Scenario 1: samples are linearly separated, but only by a narrow gap
// Scenario 2: samples are linearly separated by a huge gap
// Scenario 3: samples are NOT linearly separated -- note that the ordinary
//             Perceptron algorithm will NOT converge in this scenario.
void initSamples(int scenario)
{
    Ps = new ArrayList<Vector2d>();
    Ns = new ArrayList<Vector2d>();

    // Generate n negative and p positive samples.
    // The line w . (x,y) + b separates negative from positive samples;
    // i.e. this is the "model" we want the Perceptron to learn.
    int n = round(random(20, 40));
    int p = round(random(20, 40));
    Vector2d w = new Vector2d(5, 3);
    float b = -400;

    Vector2d offset = new Vector2d(0., 0.);

    switch (scenario) {
    case 1:
    default:
        break;

    case 2:
        offset = new Vector2d(10., 10.);
        break;

    case 3:
        offset = new Vector2d(-5., -5.);
        break;
    }

    while (Ns.size() < n || Ps.size() < p) {
        Vector2d r = new Vector2d(random(0., 100.), random(0., 100.));

        if (dot(w, r) + b < 0) {
            if (Ns.size() < n) {
                Ns.add(sub(r, offset));
            }
        } else {
            if (Ps.size() < p) {
                Ps.add(add(r, offset));
            }
        }
    }

    //perceptron = new Perceptron(100.);

    perceptron.setWeights(new Vector2d(15., 15.));
    perceptron.setBias(-600.);
    
    // Move M onto the new separating line.
    M.set(50., 50.);
    perceptron.moveToSeparator(M);    
}


void setup()
{
    size(700, 600);

    PFont myFont = createFont("Arial", 20);
    textFont(myFont);

    //randomSeed(42);

    initSamples(1);
}


void draw()
{
    background(255);

    // Determine whether mouse is over one of the two "buttons":
    Vector2d world = screen2world(mouseX, mouseY);
    boolean mouseOverM = (distn(world, M) <= 4.);
    boolean mouseOverW = (distn(world, add(M, perceptron.weights())) <= 4.);

    // Determine angle of vector w to rotate separating lines.
    float wMag = magn(perceptron.weights());
    float wRad = angleBetween2D(new Vector2d(0., 1.), perceptron.weights());

    pushMatrix();
    scale(width / (worldRight - worldLeft), height / (worldBottom - worldTop));
    translate(-worldLeft, -worldTop);

    pushMatrix();
    translate(M.x, M.y);
    rotate(wRad);

    // Draw red and blue gradients around separating line
    strokeWeight(1);

    for (int c = 1; c < 16; ++c) {
        stroke(lerpColor(#FF2020, #FFFFFF, c/16.));
        line(-200, c / 2., 200, c / 2.);
        stroke(lerpColor(#2020FF, #FFFFFF, c/16.));
        line(-200, -c / 2., 200, -c / 2.);
    }

    // Draw separating line
    stroke(#000000); strokeWeight(0.5);
    line(-200, 0, 200, 0);

    popMatrix();

    // Draw coordinate system
    stroke(#000000); strokeWeight(0.5); fill(#A0A0A0);
    line(-5, 0, 100, 0); triangle(0, 105, +2, 100, -2, 100);
    line(0, -5, 0, 100); triangle(105, 0, 100, -2, 100, +2);

    for (int k = 10; k <= 100; k += 10) {
        line(k, 0, k, 2);
        line(0, k, 2, k);
    }

    // Draw all negative and positive points
    stroke(#FF2020); strokeWeight(0.5); fill(#FF60A0);

    for (int k = 0; k < Ps.size(); ++k) {
        triangle(Ps.get(k).x - 1, Ps.get(k).y - 1,
                 Ps.get(k).x,   Ps.get(k).y + 1,
                 Ps.get(k).x + 1, Ps.get(k).y - 1);
    }

    stroke(#2020FF); strokeWeight(0.5); fill(#60A0FF);

    for (int k = 0; k < Ns.size(); ++k) {
        triangle(Ns.get(k).x - 1, Ns.get(k).y + 1,
                 Ns.get(k).x,   Ns.get(k).y - 1,
                 Ns.get(k).x + 1, Ns.get(k).y + 1);
    }

    pushMatrix();
    translate(M.x, M.y);
    rotate(wRad);

    // Draw handle with "buttons".
    stroke(#000000); strokeWeight(1); fill(#808080);
    line(0, 0, 0, wMag);

    strokeWeight((mouseOverM || mouseDragsM) ? 1.5 : 1);
    ellipse(0, 0, 5, 5);

    strokeWeight((mouseOverW || mouseDragsW) ? 1.5 : 1);
    triangle(-2, wMag - 2, 0, wMag + 2, +2, wMag - 2);

    popMatrix();

    // Create string for separating line. As the Java variant,
    //     String.format("%.1f x + %.1f y", w.x, w.y);
    // does not work in JavaScript mode, format it in a portable way:
    String separating = format1(perceptron.weights().x) + new String(" x")
                        + format1(perceptron.weights().y) + new String(" y")
                        + format1(perceptron.bias());

    // Print the equation of the separating line.
    if (showLineEq) {
        pushMatrix();
        scale(1, -1);

        ArrayList<Integer> cf = perceptron.getConfusionMatrix(Ns, Ps);

        String cf1 = nf(cf.get(0), 2) + new String(", ") + nf(cf.get(1), 2);
        String cf2 = nf(cf.get(2), 2) + new String(", ") + nf(cf.get(3), 2);

        String separating2 = separating + new String(" = 0");

        fill(#000000);

        textSize(4); textAlign(LEFT, CENTER);
        text(separating2, M.x + 4, -M.y + 4);
        //text(cf1, M.x + 8, -M.y + 10);
        //text(cf2, M.x + 8, -M.y + 14);

        popMatrix();
    } 

    // Draw left-clicked point (if any).
    if (leftclickedState != 0) {
        Vector2d U = (leftclickedState < 0 ? Ns.get(leftclickedIndex) : Ps.get(leftclickedIndex));

        strokeWeight(0.8);

        if (leftclickedState == -1) {
            stroke(#2020FF); fill(#60A0FF);
            triangle(U.x - 1, U.y + 1, U.x, U.y - 1, U.x + 1, U.y + 1);
        } else if (leftclickedState == +1) {
            stroke(#FF2020); fill(#FF60A0);
            triangle(U.x - 1, U.y - 1, U.x, U.y + 1, U.x + 1, U.y - 1);
        }

    }

    // Draw right-clicked point (if any), and pop up some informative text.
    if (rightclickedState != 0) {
        Vector2d U = (rightclickedState < 0 ? Ns.get(rightclickedIndex) : Ps.get(rightclickedIndex));

        strokeWeight(0.8);

        if (rightclickedState == -1) {
            stroke(#2020FF); fill(#60A0FF);
            triangle(U.x - 1, U.y + 1, U.x, U.y - 1, U.x + 1, U.y + 1);
        } else if (rightclickedState == +1) {
            stroke(#FF2020); fill(#FF60A0);
            triangle(U.x - 1, U.y - 1, U.x, U.y + 1, U.x + 1, U.y - 1);
        }

        float rhs = perceptron.evaluate(U);

        String line1 = new String("(") + format1(U.x) + new String(",")
                        + format1(U.y) + new String(")");
                        
        String line2 = format1(rhs);

        stroke(#000000); fill(#FFFFFF);
        rect(U.x - 2, U.y + 2, 35, 11);

        pushMatrix();
        scale(1, -1);

        stroke(#000000); fill(#000000);
        textSize(4); textAlign(LEFT, CENTER);
        text(line1, U.x, - U.y - 11);
        text(line2, U.x, - U.y - 6);

        popMatrix();
    }

    popMatrix();

    // Draw the two buttons "Estimate" and "Learn"
    stroke(#000000); fill(#FFE010);
    rect(620, 30, 40, 40, 5);
    fill(#000000);
    textSize(20); textAlign(CENTER, CENTER);
    text("~", 640, 50);

    stroke(#000000); fill(#90FF20);
    rect(620, 80, 40, 40, 5);
    fill(#000000);
    textSize(20); textAlign(CENTER, CENTER);
    text("!", 640, 100);
    
    // Draw the three "scenario buttons
    stroke(#000000); fill(#9090FF);
    rect(620, 430, 40, 40, 5);
    fill(#000000);
    textSize(20); textAlign(CENTER, CENTER);
    text("1", 640, 450);
    
    stroke(#000000); fill(#9090FF);
    rect(620, 480, 40, 40, 5);
    fill(#000000);
    textSize(20); textAlign(CENTER, CENTER);
    text("2", 640, 500);
    
    stroke(#000000); fill(#9090FF);
    rect(620, 530, 40, 40, 5);
    fill(#000000);
    textSize(20); textAlign(CENTER, CENTER);
    text("3", 640, 550);       
}


void mousePressed()
{
    // Handle the following cases:
    // 1) Left-click on one of the five buttons: trigger associated action
    // 2) Left-click on midpoint or arrow head: start to drag
    // 3) Left- or right-click on one of N or P points: set state/index

    if (mouseButton == LEFT && mouseX >= 620 && mouseX <= 660 && mouseY >= 30 && mouseY <= 70) {
        perceptron.initialize(Ns, Ps);
        M.set(50, 50);
        perceptron.moveToSeparator(M);
    } else if (mouseButton == LEFT && mouseX >= 620 && mouseX <= 660 && mouseY >= 80 && mouseY <= 120) {
        perceptron.learn(Ns, Ps);
        M.set(50, 50);
        perceptron.moveToSeparator(M);
    } else if (mouseButton == LEFT && mouseX >= 620 && mouseX <= 660 && mouseY >= 430 && mouseY <= 470) {
        initSamples(1);
    } else if (mouseButton == LEFT && mouseX >= 620 && mouseX <= 660 && mouseY >= 480 && mouseY <= 520) {
        initSamples(2);
    } else if (mouseButton == LEFT && mouseX >= 620 && mouseX <= 660 && mouseY >= 530 && mouseY <= 570) {
        initSamples(3);
    } else {
        Vector2d world = screen2world(mouseX, mouseY);
        Vector2d Mw = add(M, perceptron.weights());

        // Handle midpoint and arrow, which might be dragged.
        if (mouseButton == LEFT && distn(world, M) <= 4.) {
            mouseDragsM = true;
        } else if (mouseButton == LEFT && distn(world, Mw) <= 4.) {
            mouseDragsW = true;
        } else {
            int pressedState = 0;
            int pressedIndex = 0;

            for (int k = 0; pressedState == 0 && k < Ns.size(); ++k) {
                if (distn(world, Ns.get(k)) <= 2.) {
                    pressedState = -1;
                    pressedIndex = k;
                }
            }

            for (int k = 0; pressedState == 0 && k < Ps.size(); ++k) {
                if (distn(world, Ps.get(k)) <= 2.) {
                    pressedState = +1;
                    pressedIndex = k;
                }
            }

            if (mouseButton == LEFT) {
                leftclickedState = pressedState;
                leftclickedIndex = pressedIndex;
            } else if (mouseButton == RIGHT) {
                rightclickedState = pressedState;
                rightclickedIndex = pressedIndex;
            }
        }
    }
}


void mouseDragged()
{
    if (mouseButton == LEFT) {
        Vector2d world = screen2world(mouseX, mouseY);
        world.x = constrain(world.x, worldLeft, worldRight);
        world.y = constrain(world.y, worldBottom, worldTop);

        if (mouseDragsM) {
            M = world;
            perceptron.setBias(dot(neg(perceptron.weights()), M));
        } else if (mouseDragsW) {
            perceptron.setWeights(sub(world, M));
            perceptron.setBias(dot(neg(perceptron.weights()), M));
        }
    }
}


void mouseReleased()
{
    // If a point was left-clicked before, update the Perceptron weights w.r.t.
    // this point on mouse release.
    if (leftclickedState != 0) {
        Vector2d U = (leftclickedState == -1 ? Ns.get(leftclickedIndex) : Ps.get(leftclickedIndex));
        float label = leftclickedState; // -1 or +1

        if (perceptron.update(U, label)) {
            M.x = 50;
            M.y = 50;
            perceptron.moveToSeparator(M);
        }
    }

    mouseDragsM = false;
    mouseDragsW = false;

    leftclickedState = 0;
    rightclickedState = 0;
}

/* Vector2d.pde
 *
 * Copyright 2013 Roland Richter.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
 
 
// Class Vector2d replaces built-in PVector and adds functions
// add(.,.), sub(.,.), mult(.,.), dot(.,.), dist(.), magn(.), 
// and a modified version of angleBetween(.)

class Vector2d
{
    public Vector2d() {
        this.x = 0.;
        this.y = 0.;
    }
    
    public Vector2d(float x, float y) {
        this.x = x;
        this.y = y;
    }
    
    
    public void set(float x, float y) {
        this.x = x;
        this.y = y;
    }
    
    public float x, y;
}


float dot(Vector2d v, Vector2d w) 
{
    return v.x * w.x + v.y * w.y;
}


// Returns the squared magnitude of the vector.
float magnSq(Vector2d v) 
{
    return v.x * v.x + v.y * v.y; // i.e. dot(v, v);
}


// Returns the magnitude of the vector.
float magn(Vector2d v) 
{
    return (float) Math.sqrt(magnSq(v));
}


Vector2d neg(Vector2d v) 
{
    return new Vector2d(-v.x, -v.y);
}


Vector2d add(Vector2d v, Vector2d w)
{
    return new Vector2d(v.x + w.x, v.y + w.y);
}


Vector2d sub(Vector2d v, Vector2d w)
{
    return new Vector2d(v.x - w.x, v.y - w.y);
}


// Multiplies a vector by a scalar.
Vector2d mult(float l, Vector2d v)
{
    return new Vector2d(l * v.x, l * v.y);
}


// Returns the Euclidean distance of v and w.
float distn(Vector2d v, Vector2d w) 
{
    float dx = v.x - w.x;
    float dy = v.y - w.y;

    return (float) Math.sqrt(dx * dx + dy * dy);
}


// Computes angle between vectors v and w in the range of [0, 2 PI).
// This differs from PVector.angleBetween() which returns a value in [0, PI].
float angleBetween2D(Vector2d v, Vector2d w)
{
    float magV = magn(v);
    float magW = magn(w);
    
    if (magV == 0. || magW == 0.) {
        return 0.;
    }
    
    float cosPhi = dot(v, w) / (magV * magW);
    float sinPhi = (v.x * w.y - w.x * v.y) / (magV * magW);

    float angle = acos(cosPhi);

    if (sinPhi < 0) {
       angle = TWO_PI - angle;
    }
    
    return angle;        
}


