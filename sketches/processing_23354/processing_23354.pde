
//import processing.opengl.*;

    //General parameters
    float tSource, tAmb, a, deltaX = 1, deltaY = 1;
    //Parameters for the implicit solver
    int gridW = 150, gridH = 150;
    float deltaT = 1 / 30.0f;
    float xLast[], x[];
    float gamma, beta, sigma, delta;
    float mu, nu, xi;
    //Parameters for the explicit solver
    float[][] grid, lastGrid;
    boolean useImplicitSolver = true;

    PFont font;
    boolean bb = false;

    
    public void setup() {
        if(false){  
            javax.swing.JOptionPane.showMessageDialog(null,
            "Hello! This demo shows a graphical interpretation of the solution of the 2D heat equation." +
            "\nIt was made as an initial proof of concept used to my Ms. project on 2010" +
            "\nEverything you'll watch is generated algorithmically using HSB color model." +
            "\nI used a stable implicit solver based on Crank-Nicholson finite difference method and" +
            "\nthe classic partially stable explicit solver." + 
            "\n\nJust drag the mouse to put heat sources in the surface and press space key to switch between the two solvers." + 
            "\n\n\nThis demo is using OpenGL and it will not run properly if you don't have OpenGL libraries installed in your computer." +
            "\nIf so, please watch the video mentioned in the readme file." +
            "\n\nThank you for watching!" + 
            "\n\nAdrian N. Malaver", 
            "Heat equation solver", javax.swing.JOptionPane.INFORMATION_MESSAGE);   
            bb = true;
        }
  
        size(600, 600, P3D);

        colorMode(HSB, 100);

        font = loadFont("Univers45.vlw");


        tAmb = 20;
        tSource = 200;
        a = 1f;
        grid = new float[gridH][gridW];
        lastGrid = new float[gridH][gridW];

        //Create data array
        x = new float[gridH * gridW];
        xLast = new float[gridH * gridW];

        sigma = a * deltaT / (deltaX * deltaX * deltaY * deltaY);
        delta = 2 * (1 + sigma * (deltaY * deltaY + deltaX * deltaX));
        gamma = -sigma * deltaY * deltaY;
        beta = -sigma * deltaX * deltaX;

        xi = 2 * (1 - sigma * deltaY * deltaY - sigma * deltaX * deltaX);

        nu = sigma * deltaY * deltaY;
        mu = sigma * deltaX * deltaX;

        setInitialConditions();
    }

  
    public void draw() {
        background(0);        

        drawGrid(10, 50, width - 20, height - 60);
        updateGrid();

        textFont(font, 25);
        fill(80);
        if(useImplicitSolver){
            text("Implicit solver", 10, 30);
        } else {
            text("Explicit solver", 10, 30);
        }       
        text("Grid size: " + gridW + "x" + gridH, 180, 30);
        text("FPS: " + (int)frameRate, 400, 30);

        //Create heat source around mouse position
        if (mousePressed) {            
            int centerY = (int) ((mouseY - 50) / (float) (height-60) * (gridH-2)), centerX = (int) ((mouseX-10) / (float) (width-20) * (gridW-2)), r = 3;
            for (int i = max(centerY - r, 0); i < min(gridH, centerY + R); i++) {
                for (int j = max(0, centerX - r); j < min(gridW, centerX + R); j++) {
                    if (useImplicitSolver) {
                        xLast[i * gridW + j] = tSource;
                    } else {
                        lastGrid[max(i, 0)][max(j, 0)] = tSource;
                    }
                }
            }
        }
    }

    void setInitialConditions() {
        //Ambient temperature
        for (int i = 0; i < gridH; i++) {
            for (int j = 0; j < gridW; j++) {
                lastGrid[i][j] = tAmb;
            }
        }

        for (int i = 0; i < x.length; i++) {
            xLast[i] = tAmb;
        }
    }

    void updateGrid() {
        //Update temperature according to numerical solution of heat equation
        if (useImplicitSolver) {
            computeGaussSeidel();
        } else {
            float deltaY2 = deltaY * deltaY, deltaX2 = deltaX * deltaX, cons = a * 0.033f / (deltaX * deltaX * deltaY * deltaY);
            for (int i = 1; i < gridH - 1; i++) {
                for (int j = 1; j < gridW - 1; j++) {
                    float U = lastGrid[i][j + 1] - 2 * lastGrid[i][j] + lastGrid[i][j - 1];
                    float V = lastGrid[i + 1][j] - 2 * lastGrid[i][j] + lastGrid[i - 1][j];
                    grid[i][j] = lastGrid[i][j] + cons * (deltaY2 * U + deltaX2 * V);
                }
            }

            //Save actual state
            for (int i = 1; i < gridH - 1; i++) {
                System.arraycopy(grid[i], 1, lastGrid[i], 1, gridW - 1 - 1);
            }
        }
    }

    void computeGaussSeidel() {
        //Preparar el vector xLast
        float r[] = new float[xLast.length];

        for (int i = 0; i < x.length; i++) {
            r[i] = xLast[i] * xi;
            if (i > 0) {
                r[i] += xLast[i - 1] * nu;
            }

            if (i < x.length - 1) {
                r[i] += xLast[i + 1] * nu;
            }

            if (i >= gridW) {
                r[i] += xLast[i - gridW] * mu;
            }

            if (i < x.length - gridW - 1) {
                r[i] += xLast[i + gridW] * mu;
            }
        }

        for (int n = 0; n < 10; n++) {
            for (int i = 1; i < x.length - 1; i++) {
                x[i] = r[i];

                if (i > 0) {
                    x[i] -= gamma * xLast[i - 1];
                }

                if (i < x.length - 1) {
                    x[i] -= gamma * xLast[i + 1];
                }


                if (i >= gridW) {
                    x[i] -= beta * xLast[i - gridW];
                }


                if (i < x.length - gridW - 1) {
                    x[i] -= beta * xLast[i + gridW];
                }

                x[i] /= delta;

                //Update x status
                xLast[i] = x[i];
            }
        }
    }

    void drawGrid(float left, float top, float w, float h) {
        float xInc = w / (float) (gridW - 2), yInc = h / (float) (gridH - 2);

        //Draw cells
        beginShape(QUADS);
        float xx = left, y = top;
        for (int i = 1; i < gridH - 1; i++, y += yInc) {
            xx = left;
            for (int j = 1; j < gridW - 1; j++, xx += xInc) {
                PVector c;
                if (useImplicitSolver) {
                    c = colorFromTemparature(x[i * gridW + j]);
                } else {
                    c = colorFromTemparature(grid[i][j]);
                }

                fill(c.x, c.y, c.z);

                noStroke();
                vertex(xx, y, 0);
                vertex(xx + xInc, y, 0);
                vertex(xx + xInc, y + yInc, 0);
                vertex(xx, y + yInc, 0);
            }
        }
        endShape();
    }

    public void drawBox(float x, float y, float size, float height, PVector col) {
        beginShape(QUADS);
        //Top
        vertex(x, y, height);
        vertex(x + size, y, height);
        vertex(x + size, y + size, height);
        vertex(x, y + size, height);

        //Front
        vertex(x, y, 0);
        vertex(x + size, y, 0);
        vertex(x + size, y, height);
        vertex(x, y, height);

        //back
        vertex(x, y + size, 0);
        vertex(x + size, y + size, 0);
        vertex(x + size, y + size, height);
        vertex(x, y + size, height);

        //left
        vertex(x, y, 0);
        vertex(x, y + size, 0);
        vertex(x, y + size, height);
        vertex(x, y, height);

        //Right
        vertex(x + size, y, 0);
        vertex(x + size, y + size, 0);
        vertex(x + size, y + size, height);
        vertex(x + size, y, height);
        endShape();
    }

    public PVector colorFromTemparature(float T) {
        return new PVector(75 - T / 200 * 75, 100, 100);
    }

    
    public void keyPressed() {
        if(key == 32){
            useImplicitSolver = !useImplicitSolver;
        }
    }

