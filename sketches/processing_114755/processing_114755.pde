
import peasy.PeasyCam;



    PeasyCam camera;
    //    Picker picker;
    PVector[][][] u;
    ShallowGrid grid;
//    Random random;

    float t = 0f;

    float maxTimeStep = 1.0f / 60.0f;

    int subSteps;

    float g = 9.8f;
    float b = .8f; // lower is more viscous...???

    int gridWidth = 15;
    int gridLength = 15;

    float H = 25.0f;


    boolean RESET = false;
    boolean PAUSED = false;
    boolean drawUV = false;
    int dropSize = 3;


    enum waterModes {
        grid("Grid"), boxes("Boxes"), grayBoxes("Gray-scale Boxes") /*, filledGrid("FilledGrid")*/;

        String description;

        waterModes(String description) {
            this.description = description;
        }


        waterModes successor() {
            return values()[(ordinal() + 1) % values().length];
        }
    }

    waterModes waterMode = waterModes.boxes;


    void setup() {
        if (!RESET) {

            size(800, 600, P3D);

//            picker = new Picker(this);
//            picker.
            camera = new PeasyCam(this, 0, -34, 0, 150);

            camera.setRotations(0.44951418, -0.41636175, 0.10181959); // rotations are applied in that order
//        camera = new PeasyCam(this, 0,0, 0, 0);
//            camera.setYawRotationMode();   // like spinning a globe
//            camera.setPitchRotationMode(); // like a somersault
//            camera.setRollRotationMode();  // like a radio knob
            camera.setSuppressRollRotationMode();  // Permit pitch/yaw only.
//            camera.setMinimumDistance(.001f);

//            float fov = (float) (PI/3.0);
//            float cameraZ = (float) ((height/2.0) / tan((float) (fov/2.0)));
//            this.perspective(fov, (float)(width/height),(float)(cameraZ/100.0f), (float)(cameraZ*100.0f));
            perspective((float) (PI / 3.0), (float) width / height, 1, 100000);
        }

        if (grid != null) {
            int a = grid.selectedX;
            int b = grid.selectedZ;
            grid = new ShallowGrid(gridWidth, gridLength);
            grid.selectedX = a;
            grid.selectedZ = b;
        } else {
            grid = new ShallowGrid(gridWidth, gridLength);
        }

        /*u = new PVector[10][10][10];
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                for (int k = 0; k < 10; k++) {
                    u[i][j][k] = PVector.random3D();
                }
            }
        }    */


        frameRate(60);

        //noStroke();
    }

    void draw() {

//        camera.getState().apply(picker.getBuffer());

        //picker.

        //update frame
        background(0);

        noLights();


        // DO all calculations until a frame is ready.
        if (!PAUSED) {
            subSteps = 0;
            float maxVelocityTerm = grid.calculaterMaxValocityTerm();
//            0.009 = time * maxVelocityTerm;
            float timeStep = 0.0009f / maxVelocityTerm;
            if (timeStep > maxTimeStep)
                timeStep = maxTimeStep;

            float targetTime = t + maxTimeStep;

            while (t < targetTime) {
                grid.step(timeStep);
                t += timeStep;
                subSteps++;
            }

//            float timeStep = 1.0f/300.0f;
//            timeStep = timeStep/30.0f;
//            for (int i = 0; i < 30; i++) {
//                grid.step(timeStep);
//            }
            //      t += 1.0f/600.0f;
        }

        grid.drawShallowGrid();

        camera.beginHUD();
        fill(255);
        int ypos = 0;
        text("Framerate: " + (int) frameRate, 10, ypos += 20);
        text("Substeps: " + subSteps, 10, ypos += 20);
        text("DropSize: " + dropSize+"x"+dropSize, 10, ypos += 20);
        text("Viscosity: " + ((int)(b*10))/10.0f, 10, ypos += 20);
        text("Time: " + (int) t, 10, ypos += 20);
//        text("TimeStep: " + (int) , 10, ypos+=20);
        text("DrawMode: " + waterMode.description, 10, ypos += 20);
        text("Paused: " + PAUSED, 10, ypos += 20);
        text("r: reset\nc: println camera position\nm: change drawMode\np: pause/unpause\n[]{}:inc/dec width/length of sim\nv:draw UV Y/N\nb/B inc/Dec viscosity\ns/S: change DropSize\n1-4: Change Views", 10, ypos += 20);
        camera.endHUD();

    }

//    public void mouseClicked() {
//        int id = picker.get(mouseX, mouseY);
//        if (id > -1) {
//            int i = id % grid.width;
//            int j = id / grid.width;
//            grid.cells[i][j].h =10;
//            cubes[id].changeColor();
//        }
//    }

    void keyReleased() {
        if (key == 'r') {
            RESET = true;
            setup();
        }
        if (key == 'p') {
            PAUSED = !PAUSED;
        }
        if (key == 'c') {
            println(camera.getDistance());  // current distance
            println(camera.getLookAt());  // current distance
            println(camera.getRotations());  // current distance
        }
        if (key == 'm') {
            waterMode = waterMode.successor();
        }

        if (key == ']') {
            gridLength++;
            RESET = true;
            setup();
        }
        if (key == '[') {
            gridLength--;
            RESET = true;
            setup();
        }

        if (key == '}') {
            gridWidth++;
            RESET = true;
            setup();
        }
        if (key == '{') {
            gridWidth--;
            RESET = true;
            setup();
        }
        if (key == CODED) {
            if (keyCode == UP) {
                grid.selectedZ = max(0, grid.selectedZ - 1);
            } else if (keyCode == DOWN) {
                grid.selectedZ = min(grid.length - 1, grid.selectedZ + 1);
            } else if (keyCode == LEFT) {
                grid.selectedX = max(0, grid.selectedX - 1);
            } else if (keyCode == RIGHT) {
                grid.selectedX = min(grid.width - 1, grid.selectedX + 1);
            }
        }
        if (key == ' ') {

            float toAdd = 100;

            // 5x5, 5, want -2 to pos 2
            int offset = dropSize/2;     // 1 == 1 , 3 == 2
            for (int i = grid.selectedX -offset; i < grid.selectedX + dropSize-offset; i++) {
                    for (int j = grid.selectedZ-offset; j < grid.selectedZ+dropSize-offset; j++) {
                        if(validCell(i,j)){
                            float portion = 1.0f/ (1.0f+ abs(grid.selectedX - i) + abs(grid.selectedZ- j));
                            grid.cells[i][j].h += portion * toAdd;
                        }
                     }
            }
           
        }
        if (key == 'v') {
            drawUV = !drawUV;
        }
        if (key == 'b') {
            if(b<1) {
                b+=.1;
            } else if(b<10){
                b+=1;
            }
        }
        if (key == 'B') {
            if(b>1) {
                b-=1;
            } else if(b>0){
                b-=.1;
            }
        }
        if (key == 's') {
            dropSize+=2;
        }
        if (key == 'S') {
            if(dropSize>1){
                dropSize-=2;
            }
        }
        if (key == '1') {
            camera.reset();
            camera.setRotations(0.44951418, -0.41636175, 0.10181959);
        }
        if (key == '2') {
            camera.reset();
            camera.setRotations(1.4752423, 0.078202344, -0.030070493);
        }
        if (key == '3') {
            camera.reset();
            camera.setRotations(0.44951418, -0.41636175, 0.10181959);
        }
        if (key == '4') {
            camera.reset();
            camera.setRotations(0.44951418, -0.41636175, 0.10181959);
        }

    } // end void keyReleased()

    boolean validCell(int x, int z) {
        if (x < 0)
            return false;
        if (z < 0)
            return false;
        if (x > this.grid.width - 1)
            return false;
        if (z > this.grid.length - 1)
            return false;

        return true;
    }

