
// The inimmitable graph visualization explorer
public class Adventurer {
	public Graph g;
	public Adventurer( Graph base ) {
		g = base;
		make_all_basic_matrices();
	}

	public void make_all_basic_matrices() {
		int max = g.numbering.size();
		g.matrix = new Matrix[Graph.MatrixTypeIndex.MATRIX_FIELD_COUNT];
		float[] threeArgs = new float[] { (float)Math.random()*max, (float)Math.random()*max, (float)Math.random()*max };
		for(int i = 0; i < Graph.MatrixTypeIndex.MATRIX_FIELD_COUNT;i++) {
			Algebraicist.form(g, i);
		}
	}

	public Matrix make_random_filter(int rand_base_matrix1, int rand_base_matrix2, int rand_power, int rand_binary ) {
		//System.out.println("RF: " + rand_base_matrix1 + "," + rand_base_matrix2 + "," + rand_power + "," + rand_binary);
		Matrix f = new Matrix(g.matrix[rand_base_matrix1]);
		int max = g.numbering.size();
		float[] threeArgs = new float[] { (float)Math.random()*max, (float)Math.random()*max, (float)Math.random()*max };
		f = Arithmetician.fastMultiproduct(f, rand_power);
		f = Arithmetician.ApplyBinary(rand_binary, f, g.matrix[rand_base_matrix2], threeArgs);
		return f;
	}

	public Matrix make_random_Matrix_filter(int mod_or_not, int[] param_Base_Matrix, int[] param_Unary_Ops, int[] param_Binary_Combinators, int[] zeroOne, float[] threeArgs) {
		// We choose a filter length of max 5 matrices
		// We choose five matrices, and five unary filters to apply to each matrix
		// We choose 4 binary combinator ops to combine these 5 matrices
		// We collapse these ops right to left to construct a random filter
		// But it is only random in the sense that we choose our exploration of the filterspace randomly (or using a basic GA)
		// It is deterministic on the parameters passed in here
		// Which in GA are 'genetic code' / feature vector
		Matrix[] theFive = new Matrix[5];
		int i = 5;
		while(--i >= 0)
			theFive[i] = g.matrix[param_Base_Matrix[i]];
		if(mod_or_not == 0) {
			i = 5;
			while(--i >= 0)
				theFive[i] = Arithmetician.ApplyUnary(param_Unary_Ops[i], theFive[i], threeArgs, zeroOne );
			i = 4;
			Matrix result = theFive[4];
			while(--i >= 0)
				result = Arithmetician.ApplyBinary(param_Binary_Combinators[i], theFive[i], result, threeArgs);
			return result;
		}
		else {
			i = 5;
			while(--i >= 0)
				theFive[i] = Arithmetician.ApplyModUnary(param_Unary_Ops[i], theFive[i], threeArgs, zeroOne );
			i = 4;
			Matrix result = theFive[4];
			while(--i >= 0)
				result = Arithmetician.ApplyModBinary(param_Binary_Combinators[i], theFive[i], result, threeArgs);
			return result;
		}
	}
}

