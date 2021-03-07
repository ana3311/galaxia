class Planeta{

  private PShape planeta_shape;
  private PImage textura_planeta;
  private float x, y, z, radio, angulo, velocidad;
  boolean tiene_luna;
  private Luna luna;
  private String nombre;
  
  Planeta(float x, float y, float z, float radio, String ruta_textura, String nombre, boolean tiene_luna){
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.nombre = nombre;
    this.planeta_shape = createShape(SPHERE, this.radio);
    this.textura_planeta = loadImage(ruta_textura);
    this.planeta_shape.setTexture(textura_planeta);
    this.planeta_shape.setStroke(0);
    this.angulo = 0;
    this.velocidad = random(0.2, 0.7);
    this.tiene_luna = tiene_luna;
    if(tiene_luna){
      float radio_luna = radio / 4;
      this.luna = new Luna(x * 0.1, y * 0.1, 0, radio_luna);
    }
  }
  
  void actualizar_posicion(){
    angulo += velocidad;
    if(angulo >=360) angulo -= 360;
  }
  
  void mostrar_planeta(){
    rotateY(radians(angulo));
    translate(x, y, z);
    text(nombre, 0, -(radio + 15));
    shape(planeta_shape);
    if(tiene_luna){
      //float radio_luna = radio / 4;
      //this.luna = new Luna(x * 0.1, y * 0.1, 0, radio_luna);
      mostrar_luna_en_planeta();
    }
  }
  
  void mostrar_luna_en_planeta(){
    pushMatrix();
    luna.mostrar_luna();
    popMatrix();
    luna.actualizar_posicion();
  }
}
