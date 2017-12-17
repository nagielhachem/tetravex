#pragma once

#include "tetravex.hpp"

#include <iostream>
#include <vector>
#include <random>

class Solver{

	public:
		Solver();

		void solve(Tetravex& t, double lambda = 0.99, int verbose = 0);

		double get_U(const std::vector<Piece>& pieces, const int width, const int height);
		double init_T(Tetravex& t);

	private:
		std::mt19937 gen;
		std::uniform_real_distribution<double> dist;

	  double transition_prob(double delta_U, double T);
		int sample(double delta_U, double T);
};

