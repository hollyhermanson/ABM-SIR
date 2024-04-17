{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "### SIR Model Solving ###\n",
    "A worksheet for solving the SIR model outlined in https://maa.org/press/periodicals/loci/joma/the-sir-model-for-spread-of-disease-eulers-method-for-systems"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [
    {
     "ename": "NameError",
     "evalue": "name 'var' is not defined",
     "output_type": "error",
     "traceback": [
      "\u001b[0;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[0;31mNameError\u001b[0m                                 Traceback (most recent call last)",
      "Cell \u001b[0;32mIn[1], line 1\u001b[0m\n\u001b[0;32m----> 1\u001b[0m \u001b[43mvar\u001b[49m(\u001b[38;5;124m'\u001b[39m\u001b[38;5;124ms i r t\u001b[39m\u001b[38;5;124m'\u001b[39m)\n\u001b[1;32m      2\u001b[0m b\u001b[38;5;241m=\u001b[39m\u001b[38;5;241m1\u001b[39m\u001b[38;5;241m/\u001b[39m\u001b[38;5;241m2\u001b[39m\n\u001b[1;32m      3\u001b[0m k\u001b[38;5;241m=\u001b[39m\u001b[38;5;241m1\u001b[39m\u001b[38;5;241m/\u001b[39m\u001b[38;5;241m4\u001b[39m\n",
      "\u001b[0;31mNameError\u001b[0m: name 'var' is not defined"
     ]
    }
   ],
   "source": [
    "var('s i r t')\n",
    "b=1/2\n",
    "k=1/4\n",
    "sys = [-b*s*i, b*s*i - k*i, k*i]\n",
    "ics = [0,1,1.27e-6,0]\n",
    "P = desolve_system_rk4(sys,[s,i,r],ics=ics,ivar=t, end_points=120)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "S_pts = [[i,j] for i,j,k,l in P]\n",
    "S_plot = list_plot(S_pts,color='blue')\n",
    "I_pts = [[i,k] for i,j,k,l in P]\n",
    "I_plot = list_plot(I_pts,color='red')\n",
    "R_pts = [[i,l] for i,j,k,l in P]\n",
    "R_plot = list_plot(R_pts,color='green')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "show(S_plot+I_plot+R_plot)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# Fit a Gaussian\n",
    "var('x sigma mu M')\n",
    "assume(sigma>0)\n",
    "assume(M>0)\n",
    "model(x) = M * (1/sqrt(2*pi*sigma**2)) * exp(-(x-mu)**2 / (2*sigma**2))\n",
    "fit_result = find_fit(I_pts, model, initial_guess=[.1, 75, 11])  # Replace with your initial guesses\n",
    "print(fit_result)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "?list_plot"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "N(3.06 * (1/sqrt(2*pi*(8.3)**2)))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "show(I_plot)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import csv"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "with open(\"tenthousand.csv\", 'r') as csvfile:\n",
    "    reader = csv.reader(csvfile)\n",
    "    data = []\n",
    "    for row in reader:\n",
    "        data.append(row)\n",
    "    \n",
    "print(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "data_float = []\n",
    "for i in range(1, len(data)):\n",
    "    data_float.append([float(data[i][0]),float(data[i][1])])\n",
    "print(data_float)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "for i in range(1,len(data)):\n",
    "    print(i)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "var('x sigma mu M')\n",
    "assume(sigma>0)\n",
    "assume(M>0)\n",
    "model(x) = M * (1/sqrt(2*pi*sigma**2)) * exp(-(x-mu)**2 / (2*sigma**2))\n",
    "fit_result1 = find_fit(I_pts, model, initial_guess=[.1, 75, 11])  # Replace with your initial guesses\n",
    "print(fit_result1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "show(list_plot(data_float,color='orange'))\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "I_pts"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.11.1"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
