class Particle
{
  //your code here
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle(){
    myX = myY = 250;
    myColor = color(120,
                    (int)(Math.random()*160)+120,
                    255);
    mySpeed = Math.random()*10;
    myAngle = Math.random()*2*Math.PI;
  }
  void move(){
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
  }
  void show(){
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, 5,5);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  //your code here
  OddballParticle(){
    myX = myY = 250;
    myColor = color(255,0,0);
    mySpeed = Math.random()*2;
    myAngle = Math.random()*2*Math.PI;
  }
  void move(){
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
  }
  void show(){
    noStroke();
    fill(myColor);
    rect((float)myX, (float)myY, 50,50);
  }
}
//your code here

Particle [] ball;

void setup()
{
  //your code here
  size(500,500);
  ball = new Particle[500];
  for(int i = 2; i<ball.length; i++){
    ball[i] = new Particle();
  }
  for(int i = 0; i<2; i++){
    ball[i] = new OddballParticle();
  }
}
void draw()
{
  //your code here
  fill(0,0,0,10);
  rect(0,0,500,500);
  for(int i = 0; i<ball.length; i++){
    ball[i].show();
    ball[i].move();
  }
}
