

class Layer {
  ArrayList neurons;
  int num;
  int laynum;
  Solver parent;

  Layer(int _num, int _laynum, Solver _parent) {
    num = _num;
    laynum = _laynum;
    parent = _parent;

    println("---------------------");

    if (laynum==0) {
      neurons = new ArrayList();
      for (int i = 0 ; i < num;i++) {
        neurons.add(new Neuron(cnt,INS,this));
        cnt++;
      }
    } else {

      Layer prelayer = (Layer)parent.layers.get(laynum-1);
      Layer base = (Layer)parent.layers.get(0);
      // collect prelayer neurons

      ArrayList _ins = new ArrayList();

      for (int n = 0 ; n < prelayer.neurons.size();n++) {
        _ins.add((Neuron)prelayer.neurons.get(n));
      }
      
      
      // bias neurons
      
     // _ins.add((Neuron)base.neurons.get(0));
      //_ins.add((Neuron)base.neurons.get(1));

      //_ins.add((Neuron)base.neurons.get(2));
      //_ins.add((Neuron)base.neurons.get(3));

      neurons = new ArrayList();

      for (int i = 0 ; i < num ; i++) {

        neurons.add(new Neuron(cnt,_ins,this));
        cnt++;
      }
    }

    //println(neurons.size());
  }
}


