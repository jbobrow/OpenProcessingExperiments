

void setup()
{
    int screenwidth = 400;
    int screenheight = 150;
    int leftmargin = 60;
    int rightmargin = 10;
    int topmargin = 10;
    int bottommargin = 20;
    int y_num_ticks = 4;
    int tick_padding = 5;
 
    int chart_x = leftmargin;
    int chart_y = screenheight-bottommargin;
    int chart_width = screenwidth - leftmargin - rightmargin;
    int chart_height = screenheight - topmargin - bottommargin;
 smooth();
    size(screenwidth, screenheight);
    background(0);
 
    int[] numbers = { 11,11,5,3,1,16,18 };
 
 float w = float(chart_width)/numbers.length;
 int maxnumber = max(numbers);
 float h = float(chart_height)/maxnumber;

 
    stroke(100,100,100);
    line(chart_x, chart_y, chart_x+chart_width, chart_y);
    line(chart_x, chart_y, chart_x, chart_y-chart_height);
 
    int y_tick_h = chart_height/(y_num_ticks-1);
    int y_tick_val = maxnumber / (y_num_ticks-1);
 
    textAlign(RIGHT, CENTER);
    for(int i=0;i<y_num_ticks;i++){
        line(chart_x, chart_y-i*y_tick_h, chart_x+chart_width, chart_y-i*y_tick_h);
        text(i*y_tick_val, chart_x-tick_padding, chart_y-i*y_tick_h);
    }
 
    fill(255,255,255);
    textAlign(CENTER, TOP);
    for(int i=0;i<numbers.length;i++){
        rect(chart_x+i*w, chart_y, w, -h*numbers[i]);
        text(i, chart_x+i*w+w/2, chart_y+tick_padding);
    }
}


