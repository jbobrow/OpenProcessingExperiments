
class Comentario{
  
  String texto;
  String titulo;
  Usuario usuario;
 float x;
 float y;
 int parent;
 int id;
  public Comentario(int _id,String _titulo,  String _texto,  Usuario usuario, int _parent){
    this.id=_id;
    this.usuario=usuario;
    this.texto=_texto;
    this.parent=_parent;
    this.titulo=_titulo;
  }

}

