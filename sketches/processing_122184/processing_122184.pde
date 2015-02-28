
/*
   Live bubble sort.
   Step-by-step visualization of the bubble sort algorithm.
*/

int num_items = 20;
int minval = 1;
int maxval = 99;
int visitor, tail;

int[] unsorted;
int[] quicksorted;
int[] bubblesorted;


void setup() {
    size(450, 400);
    colorMode(HSB,360);
    textFont(createFont("SansSerif", 12, true));
    noStroke();
    smooth();

    frameRate(20);
    tail = num_items-1;

    unsorted = new int[num_items];
    for (int i=0; i<num_items; i++) {
        unsorted[i] = (int) random(minval, maxval);
    }

    quicksorted = new int[num_items];
    arrayCopy(unsorted, quicksorted);
    quicksort(quicksorted, 0, num_items-1);

    bubblesorted = new int[num_items];
    arrayCopy(unsorted, bubblesorted);

    visitor = 0;
}


void draw() {
    fill(360, 200);
    rect(0, 0, width, height);

    fill(0);
    textSize(12);
    text("Right-click to generate a new random array.", 30,370);

    visualize("Unsorted",      unsorted,     30,50,  20, false);
    visualize("Quick-sorted",  quicksorted,  30,150, 20, false);
    visualize("Bubble sort",   bubblesorted, 30,250, 20, true);

    bubblesort_one_step();
}

void mousePressed() {
    if (mouseButton == RIGHT)
        setup();
}

void bubblesort_one_step() {
    if (tail == 0)
        // We're done
        return;

    if (bubblesorted[visitor] > bubblesorted[visitor+1]) {
        int swap = bubblesorted[visitor];
        bubblesorted[visitor] = bubblesorted[visitor+1];
        bubblesorted[visitor+1] = swap;
    }
    else {
        // Skip already sorted items
        visitor++;
        if (visitor == tail) {
            visitor = 0;
            tail--;
        }
    }
}

// Quicksort algorithm
void quicksort(int[] items, int start, int end) {
    if (start < end) {
        int p = start;
        int q = items[start];
        for (int i=start; i <= end; i++ ) {
            if (q > items[i]) {
                p++;
                int swap = items[p];
                items[p] = items[i];
                items[i] = swap;
            }
        }
        int swap = items[start];
        items[start] = items[p];
        items[p] = swap;
        quicksort( items, start, p-1 );
        quicksort( items, p+1, end );
    }
}

void visualize(String caption,
               int[] values,
               float x, float y, float xstep,
               boolean showCursor) {
    fill(0);
    textSize(14);
    text(caption, x, y);

    textSize(10);
    for (int i=0; i < values.length; i++) {
        int v = values[i];

        if (i == visitor+1 && showCursor) {
            fill(0);
            noStroke();
            rect(x+(xstep*i), y+3, 5, 5);
        }

        fill(0);
        text(str(v), x+(xstep*i), y+20);

        float w = map(v, minval, maxval, 3, 15);
        float h = map(v, minval, maxval, 10, 50);

        fill( valueToColor(v) );
        rect(x+(xstep*i), y+25, w, h);
    }
}

// Convert a  [minval, maxval] value to a color
int valueToColor(int value) {
    float hue = norm(value, minval, maxval) * 360;
    return color(hue, 180, 360);
}
