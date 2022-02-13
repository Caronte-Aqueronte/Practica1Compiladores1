/* comienzo del codigo del usuario*/
package analizador;
import java.util.ArrayList;
/*final del codigo del usuario */

/*inicio de la configuracion*/
%%

%class Analizador
%unicode
%line
%column
%int
%public

%{
		private ArrayList<String> enteros = new ArrayList<>();
		private int numeroDeVocales = 0;
    		private int palabrasUnaVocal = 0;
    		private int palabrasDosVocales = 0;
    		private int palabrasTresVocales = 0;
    		private int palabrasCuatroVocales = 0;
    		private int palabrasCincoVocales = 0;
   		
		public int getPalabrasUnaVocal() {
        		return this.palabrasUnaVocal;
    		}
		public void setPalabrasUnaVocal(int palabrasUnaVocal) {
        		this.palabrasUnaVocal = palabrasUnaVocal;
		}

		public int getPalabrasDosVocales() {
			return palabrasDosVocales;
		}

		public void setPalabrasDosVocales(int palabrasDosVocales) {
			this.palabrasDosVocales = palabrasDosVocales;
		}

		public int getPalabrasTresVocales() {
			return palabrasTresVocales;
		}

		public void setPalabrasTresVocales(int palabrasTresVocales) {
			this.palabrasTresVocales = palabrasTresVocales;
		}

		public int getPalabrasCuatroVocales() {
			return palabrasCuatroVocales;
		}

		public void setPalabrasCuatroVocales(int palabrasCuatroVocales) {
			this.palabrasCuatroVocales = palabrasCuatroVocales;
		}

    		public int getPalabrasCincoVocales() {
       			 return palabrasCincoVocales;
		}

		private void guardarEntero() {
			enteros.add("Entero en la linea "+ yyline+ " y columna "+ yycolumn);
	    	}

		public int getNumeroDeVocales(){
			return this.numeroDeVocales;
		}

		public ArrayList<String> getEnteros(){
			return this.enteros;
		}
		
		public void setNumeroDeVocales(int numeroDeVocales){
			this.numeroDeVocales = numeroDeVocales;
		}

		public void contarVocales(){
			switch (getNumeroDeVocales()) {
                    		case 1:
                        	palabrasUnaVocal++;
                       		break;
                    	case 2:
                        	palabrasDosVocales++;
                        	break;
                    	case 3:
                        	palabrasTresVocales++;
                        	break;
                    	case 4:
                        	palabrasCuatroVocales++;
                        	break;
                    	case 5:
                        	palabrasCincoVocales++;
                        	break;
                }
			setNumeroDeVocales(0);
		}
%}
%% 


[a|e|i|o|u|A|E|I|O|U] {numeroDeVocales++;}
[0-9] {guardarEntero();}
[" "] {contarVocales();}
[\n]  {contarVocales();}
[^] {}
