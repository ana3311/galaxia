class Luna{

  private PShape luna_shape;
  private PImage textura_luna;
  private float x, y, z, radio, angulo, velocidad;
  
  Luna(float x, float y, float z, float radio){
    this.x = x;
    this.y = y;
    this.z = z;
    this.radio = radio;
    this.luna_shape = createShape(SPHERE, this.radio);
    this.textura_luna = loadImage("imagenes/luna.png");
    this.luna_shape.setTexture(textura_luna);
    this.luna_shape.setStroke(0);
    this.angulo = 0;
    this.velocidad = random(0.7, 1);
  }
  
  void actualizar_posicion(){
    angulo += velocidad;
    if(angulo >= 360) angulo -= 360;
  }
  
  void mostrar_luna(){
    rotateY(radians(angulo));
    translate(x, y, z);
    shape(luna_shape);
  }
}
