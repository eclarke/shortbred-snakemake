SAMPLES, = glob_wildcards("data_files/{sample}.fasta")

rule all:
 input:
  expand("results/{sample}.sb", sample=SAMPLES)

rule shortbred:
 input:
  "data_files/{sample}.fasta"
 output:
  results = "results/{sample}.sb",
  tmp_dir = temp("results/tmp/{sample}")
 conda:
  "shortbred.yaml"
 shell:
  """
  shortbred/shortbred_quantify.py \
  --markers ShortBRED_CARD_2017_markers.faa \
  --wgs {input}	\
  --results {output.results} \
  --tmp {output.tmp_dir} \
  --usearch $HOME/bin/usearch \
  --threads 12
  """