configfile:"path/to/config/config.yaml"
#creates a "reads" folder and downloads fastq read files from a given SRA accession number
rule fetch_FASTQ_from_SRA:
    output:
        temp("reads/{accession}/{accession}_1.fastq"),
        temp("reads/{accession}/{accession}_2.fastq")
    params:
        args = "--split-files --progress --details",
        accession = "{accession}"
    log:
        "reads/{accession}.log"
    conda:
        "env.yml"
    shell:
        'mkdir -p reads/{params.accession} && '
        'fasterq-dump {params.args} {params.accession} -O reads/{params.accession}'
