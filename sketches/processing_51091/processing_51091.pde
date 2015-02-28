
int graph_cycle = 0;
float[][][] pointer = new float[500][2][500]
void setup(){
    size(600,800);
    for(int t=0;t<500;t++){
        for(int i=0;i<500;i++){
            pointer[i][0][t] = height/2+sin(i+sin(i*(9,0+t/500.0)))*8.0;
            pointer[i][1][t] = height/2+cos(i+cos(i*(9,0+t/500.0)))*8.0;
            }
          }            
    }
void draw_graph(int graph_t){
    beginShape()
        for(int i = 0;i<500;i++){
            vertex(pointer[i][0][graph_t],pointer[i][0][graph_t]);
            }
            }
void draw(){
    draw_graph(graph_cycle);
    if(graph_cycle => 500){
        graph_cycle=0;
        }
        graph_cycle++;
        }         
