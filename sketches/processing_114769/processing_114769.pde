
class ShallowGrid {
        int width;
        int length;
        ShallowCell[][] cells;
        float distance = 10;    // visualization help...should I have any bearing on sim?
        float maxHeight = H * 2;
        int selectedX = 0;
        int selectedZ = 0;


        ShallowGrid(int width, int length) {
            this.width = width;
            this.length = length;
            cells = new ShallowCell[this.width][this.length];
            for (int i = 0; i < this.width; i++) {
                for (int j = 0; j < this.length; j++) {
                    cells[i][j] = new ShallowCell(this, i, j, H/*+random(1.0f)*/, 0, 0);
                }
            }
        }

        void drawShallowGrid() {
            translate(-this.width * distance / 2, 0, -this.length * distance / 2);

            if (waterMode == waterModes.grid) {
                for (int i = 0; i < this.width - 1; i++) {
                    for (int j = 0; j < this.length - 1; j++) {
                        float x1 = cells[i][j].x * distance + distance / 2;
                        float y1 = -cells[i][j].h;
                        float z1 = cells[i][j].z * distance + distance / 2;
                        //stroke(255); strokeWeight(1); point(x1,y1,0);  // draw original grid

                        float x2 = cells[i + 1][j].x * distance + distance / 2;
                        float y2 = -cells[i + 1][j].h;
                        float z2 = cells[i + 1][j].z * distance + distance / 2;

                        float x3 = cells[i + 1][j + 1].x * distance + distance / 2;
                        float y3 = -cells[i + 1][j + 1].h;
                        float z3 = cells[i + 1][j + 1].z * distance + distance / 2;

                        float x4 = cells[i][j + 1].x * distance + distance / 2;
                        float y4 = -cells[i][j + 1].h;
                        float z4 = cells[i][j + 1].z * distance + distance / 2;


                        stroke(40, 100, 134);
                        noFill();
                        beginShape();
                        vertex(x4, y4, z4);
                        vertex(x1, y1, z1);
                        vertex(x2, y2, z2);
                        endShape();

                    }
                }
            } else if (waterMode == waterModes.boxes || waterMode == waterModes.grayBoxes) {
//                int pickerNumber=0;
                for (int i = 0; i < this.width; i++) {
                    for (int j = 0; j < this.length; j++) {
                        translate(i * distance, 0, j * distance);
//                        picker.start(pickerNumber);
                        cells[i][j].drawCell();
//                        pickerNumber++;
                        translate(-i * distance, 0, -j * distance);
                    }
                }
            }


            // Draw Guide Lines
            stroke(0, 255, 0);
            strokeWeight(1f);
            for (int i = 0; i <= this.width; i++) {    // line should be from 0, length* dist
                line(i * distance, 0, 0, i * distance, 0, this.length * distance);
            }
            for (int i = 0; i <= this.length; i++) {    // line should be from 0, length* dist
                line(0, 0, i * distance, this.width * distance, 0, i * distance);
            }
            stroke(0, 125, 125);
            line(0, 0, 0, 0, -maxHeight, 0);
            line(0, 0, this.length * distance, 0, -maxHeight, this.length * distance);
            line(this.width * distance, 0, 0, this.width * distance, -maxHeight, 0);
            line(this.width * distance, 0, this.length * distance, this.width * distance, -maxHeight, this.length * distance);

        }

        void step(float timeStep) {
//            float HSum = 0f;
            for (int i = 0; i < this.width; i++) {
                for (int j = 0; j < this.length; j++) {
                    cells[i][j].preStep();
//                    HSum+=cells[i][j].h;
                }
            }
//            H = HSum/(this.width/this.length);
            for (int i = 0; i < this.width; i++) {
                for (int j = 0; j < this.length; j++) {
                    cells[i][j].step(timeStep);
                }
            }
        }

        float calculaterMaxValocityTerm() {
            float result = 0.0f;
            for (int i = 0; i < this.width; i++) {
                for (int j = 0; j < this.length; j++) {
                    if (cells[i][j].u > result)
                        result = cells[i][j].u;
                    if (cells[i][j].v > result)
                        result = cells[i][j].v;
                }
            }
            return result;
        }

        class ShallowCell {
            float direction;
            ShallowGrid grid;
            float h;  // height
            float u;  // x velocity
            float v;  // y velocity

            float h_old; // hold data while computing
            float u_old;
            float v_old;

            int x;  // place in grid
            int z;
            boolean selected = false;

            float distanceBetweenCells = 1.0f;

            ShallowCell(ShallowGrid grid, int x, int z, float h, float u, float v) {
                this.grid = grid;
                this.h = h;
                this.u = u;
                this.v = v;
                this.x = x;
                this.z = z;
//                this.direction = random(.3f);

                this.h_old = h;
                this.u_old = u;
                this.v_old = v;
            }


            void drawCell() {
//                stroke(255);
//                strokeWeight(4);
//                point(0,-this.h*10,0);


                strokeWeight(1);
                stroke(0, 255, 0);
//                noStroke();
//                fill(0,29,200,100f);
//                fill(0,0,255*(this.h/maxHeight),100f); // alpha
                fill(0, 0, 255 * (this.h / maxHeight));
                if (waterMode == waterModes.grayBoxes) {
                    noStroke();
                    fill(255 * (this.h / maxHeight), 255 * (this.h / maxHeight), 255 * (this.h / maxHeight));
                }
                if (x == selectedX && z == selectedZ) {
                    fill(255 /** (this.h / maxHeight)*/, 0, 0);
                }
                translate(distance / 2, -((this.h + H) / 2), distance / 2);
                box(this.grid.distance, this.h + H, this.grid.distance);
                if (drawUV) {
                    stroke(255, 255, 102);
                    strokeWeight(2);
                    line(0, -((this.h + H) / 2), 0, u * distance, -((this.h + H) / 2), v * distance);
//                    line(0, 0, this.length * distance, 0, -maxHeight, this.length * distance);
//                    line(this.width * distance, 0, 0, this.width * distance, -maxHeight, 0);
                }
                translate(-distance / 2, ((this.h + H) / 2), -distance / 2);
            }

            void step(float timeStep) {
                calculateH(timeStep);
                calculateUV(timeStep);
                //    println(x+" " +z+" " +grid.width+" " +grid.length);

                /*
                this.h += this.direction;
                if (this.h > maxHeight) {
                    this.h = maxHeight;
                    this.direction = -this.direction;
                } else if (this.h < 0) {
                    this.h = 0;
                    this.direction = -this.direction;
                }   */
            }

            void calculateUV(float timeStep) {
                float h_old_x_minus_ - 1, z).h_old;
                float h_old_x_plus_ + 1, z).h_old;
                float h_old_z_minus_ z - 1).h_old;
                float h_old_z_plus_ z + 1).h_old;

                if (x == 0)
                    h_old_x_minus_
                if (z == 0)
                    h_old_z_minus_
                if (x == this.grid.width - 1)
                    h_old_x_plus_
                if (z == this.grid.length - 1)
                    h_old_z_plus_

                u = u_old + timeStep * (-g * ((h_old_x_plus_one - h_old_x_minus_one) / (2.0f * distanceBetweenCells)) - b * u_old);
                v = v_old + timeStep * (-g * ((h_old_z_plus_one - h_old_z_minus_one) / (2.0f * distanceBetweenCells)) - b * v_old);

                if (x == 0)
                    u = abs(u);
                if (z == 0)
                    v = abs(v);
                if (x == this.grid.width - 1)
                    u = -abs(u);
                if (z == this.grid.length - 1)
                    v = -abs(v);
            }

            void calculateH(float timeStep) {

                // Do i need big H??
                // do i need to adjust delta x,z?
                float subA = (getCell(x + 1, z).u_old * (getCell(x + 1, z).h_old + H) - getCell(x - 1, z).u_old * (getCell(x - 1, z).h_old + H)) / (2.0f * distanceBetweenCells);

                float subB = (getCell(x, z + 1).v_old * (getCell(x, z + 1).h_old + H) - getCell(x, z - 1).v_old * (getCell(x, z - 1).h_old + H)) / (2.0f * distanceBetweenCells);

                float result = h_old + timeStep * (-subA - subB);

//                h = result;
                h = max(result, -H);

            }

            ShallowCell getCell(int x, int z) {
                if (x < 0)
                    x = 0;
                if (x >= this.grid.width)
                    x = this.grid.width - 1;
                if (z < 0)
                    z = 0;
                if (z >= this.grid.length)
                    z = this.grid.length - 1;
                return grid.cells[x][z];
            }

            void preStep() {
                this.h_old = this.h;
                this.u_old = this.u;
                this.v_old = this.v;
            }
        }
